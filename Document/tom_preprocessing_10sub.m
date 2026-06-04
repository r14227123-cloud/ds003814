%% ========================================================================
%  ToM fMRI Automated Preprocessing Pipeline (10 Subjects)
%  Reproducibility Log: Created in 2026 for ds003814 dataset
%% ========================================================================

clear; clc;
spm('defaults', 'FMRI'); % 初始化 SPM 設定
spm_jobman('initcfg');   % 初始化批次管理器

% -------------------------------------------------------------------------
% 1. 基本環境與路徑配置 (請根據你的電腦實際路徑修改)
% -------------------------------------------------------------------------
% 定義你的工廠藍圖檔案路徑
jobfile = {'/home/chsinchi/subjects_nii/ds003814/tom_preprocessing_10sub_job.m'};

% 定義資料庫的主目錄 (WSL 在 Windows 下通常會映射成這個格式，或者直接寫 Linux 路徑)
base_dir = '/home/chsinchi/subjects_nii/ds003814/';

% 10 個受試者的編號清單 (對應你的資料夾名稱)
subject_list = {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10'};

% -------------------------------------------------------------------------
% 2. 結構影像選秀紀錄表 (根據你的 Check Reg 檢查結果動態指派！)
% -------------------------------------------------------------------------
% 因為每個受試者的最完美的 T1/T2 Run 可能不同，我們在這裡用一個矩陣記錄下來
% 第一行是該受試者要用的 T1 Run 編號；第二行是 T2 Run 編號
% 範例：Subj 01 用 Run 2/2；Subj 02 用 Run 1/1... 請根據你的紀錄表修改數字！
structural_selection = [ ...
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2;   % T1w run selections for Subj 01-10
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2    % T2w run selections for Subj 01-10
];

% -------------------------------------------------------------------------
% 3. 核心全自動化自動跑人迴圈 (Loop over 10 subjects)
% -------------------------------------------------------------------------
nrun = length(subject_list); % 自動計算受試者總數 (10)

for crun = 1:nrun
    sub_id = subject_list{crun};
    fprintf('=====> 正在幫受試者 sub-ident%s 建立實體檔案路徑...\n', sub_id);
    
    % 1. 讀取該受試者專屬的 T1 和 T2 選秀結果（數字：例如 1 或 2）
    chosen_t1_run = structural_selection(1, crun);
    chosen_t2_run = structural_selection(2, crun);

    % 【💡定義好 anat 和 func 的資料夾路徑】
    anat_dir = fullfile(base_dir, ['sub-ident' sub_id], 'anat');
    func_dir = fullfile(base_dir, ['sub-ident' sub_id], 'func');

    % 2. 核心：動態組裝 T1w 的絕對路徑
    %    這裡用 sprintf('%02d', ...) 把數字自動補零變成字串'0x'
    t1_file_name = sprintf('sub-ident%s_run-%02d_T1w.nii', sub_id, chosen_t1_run);
    full_t1_path = fullfile(anat_dir, t1_file_name);

    % 3. 動態組裝 T2w 的絕對路徑
    t2_file_name = sprintf('sub-ident%s_run-%02d_T2w.nii', sub_id, chosen_t2_run);
    %    【💡 同樣包成 Cell 格式】
    full_t2_path = fullfile(anat_dir, t2_file_name);

    % 4. 【4D 魔法展開】組裝功能影像（EPI）的 4 個 Run 路徑，每個 Run 展開成 162 張
    epi_runs_paths = cell(1, 4);
    for r = 1:4
        epi_file_name = sprintf('sub-ident%s_task-tomloc2_run-%02d_echo-2_bold.nii', sub_id, r);
        
        % 使用 SPM 內建功能，把單一 4D .nii 檔案展開成 162 個獨立時間點的字元陣列
        % 產出的格式會自動帶有 ,1, ,2, ... ,162
        expanded_frames = spm_select('ExtList', func_dir, epi_file_name, 1:162);
        
        % 將其轉換為 SPM 批次系統認得的 cell string 格式
        epi_runs_paths{r} = cellstr(expanded_frames);
    end

    % ---------------------------------------------------------------------
    % 🎯 【檢查點】列印出來確認路徑與 4D 展開是否成功
    % ---------------------------------------------------------------------
    disp(['[T1 實體路徑]: ' full_t1_path]); % 修正後，這裡就可以用 {1} 讀取了！
    disp(['[EPI Run 1 總張數]: ' num2str(length(epi_runs_paths{1})) ' 張 (應為 162)']);
    
    % ---------------------------------------------------------------------
    % 🚀 【正式對接啟動】把組裝好的 6 個變數，打包送進工廠黑盒子！
    % ---------------------------------------------------------------------
    inputs = { ...
        epi_runs_paths{1}, ... % inputs{1}
        epi_runs_paths{2}, ... % inputs{2}
        epi_runs_paths{3}, ... % inputs{3}
        epi_runs_paths{4}, ... % inputs{4}
        {full_t2_path},      ... % inputs{5}
        {full_t1_path}       ... % inputs{6}
    };
    
    % 命令 SPM 執行聯動任務！
    spm_jobman('run', jobfile, inputs{:});
end

fprintf('\n🎉 恭喜！所有 10 位受試者的 Preprocessing 流水線全部順利執行完畢！\n');