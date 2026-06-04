function tom_preprocessing_10sub_job(inputs)
% 這行宣告能讓這份檔案變成一個接收窗口，承接外面主腳本外送進來的 6 個活變數！

%-----------------------------------------------------------------------
% Job saved on 04-Jun-2026 09:01:29 by cfg_util (rev $Rev: 8183 $)
% spm SPM - SPM25 (25.01.02)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%%
matlabbatch{1}.spm.spatial.realign.estwrite.data = {inputs{1}, inputs{2}, inputs{3}, inputs{4}};


%%
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.quality = 0.95;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.sep = 1.5;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.fwhm = 1;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.rtm = 0;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{2}.spm.temporal.st.scans{1}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{2}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{3}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.scans{4}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 4)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rfiles'));
matlabbatch{2}.spm.temporal.st.nslices = 48;
matlabbatch{2}.spm.temporal.st.tr = 2;
matlabbatch{2}.spm.temporal.st.ta = 2;
matlabbatch{2}.spm.temporal.st.so = [0 0.865 1.7325 0.6175 1.485 0.37 1.2375 0.1225 0.99 1.855 0.7425 1.6075 0.495 1.36 0.2475 1.1125 0 0.865 1.7325 0.6175 1.485 0.37 1.2375 0.1225 0.99 1.855 0.7425 1.6075 0.495 1.36 0.2475 1.1125 0 0.865 1.7325 0.6175 1.485 0.37 1.2375 0.1225 0.99 1.855 0.7425 1.6075 0.495 1.36 0.2475 1.1125];
matlabbatch{2}.spm.temporal.st.refslice = 0;
matlabbatch{2}.spm.temporal.st.prefix = 'a';
matlabbatch{3}.spm.spatial.coreg.estimate.ref(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{3}.spm.spatial.coreg.estimate.source = inputs{5};
matlabbatch{3}.spm.spatial.coreg.estimate.other = {''};
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{3}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{4}.spm.spatial.coreg.estimate.ref = inputs{5};
matlabbatch{4}.spm.spatial.coreg.estimate.source = inputs{6};
matlabbatch{4}.spm.spatial.coreg.estimate.other = {''};
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{5}.spm.spatial.preproc.channel.vols = inputs{6};
matlabbatch{5}.spm.spatial.preproc.channel.biasreg = 0.0001;
matlabbatch{5}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{5}.spm.spatial.preproc.channel.write = [0 0];
matlabbatch{5}.spm.spatial.preproc.tissue(1).tpm = {'/home/chsinchi/subjects_nii/ds003814/template/TPM.nii,1'};
matlabbatch{5}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{5}.spm.spatial.preproc.tissue(1).native = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(1).warped = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(2).tpm = {'/home/chsinchi/subjects_nii/ds003814/template/TPM.nii,2'};
matlabbatch{5}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{5}.spm.spatial.preproc.tissue(2).native = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(2).warped = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(3).tpm = {'/home/chsinchi/subjects_nii/ds003814/template/TPM.nii,3'};
matlabbatch{5}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{5}.spm.spatial.preproc.tissue(3).native = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(3).warped = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(4).tpm = {'/home/chsinchi/subjects_nii/ds003814/template/TPM.nii,4'};
matlabbatch{5}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{5}.spm.spatial.preproc.tissue(4).native = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(4).warped = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(5).tpm = {'/home/chsinchi/subjects_nii/ds003814/template/TPM.nii,5'};
matlabbatch{5}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{5}.spm.spatial.preproc.tissue(5).native = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(5).warped = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(6).tpm = {'/home/chsinchi/subjects_nii/ds003814/template/TPM.nii,6'};
matlabbatch{5}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{5}.spm.spatial.preproc.tissue(6).native = [1 1];
matlabbatch{5}.spm.spatial.preproc.tissue(6).warped = [1 1];
matlabbatch{5}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{5}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{5}.spm.spatial.preproc.warp.reg = [0 0 0.1 0.01 0.04];
matlabbatch{5}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{5}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{5}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{5}.spm.spatial.preproc.warp.write = [1 1];
matlabbatch{5}.spm.spatial.preproc.warp.vox = NaN;
matlabbatch{5}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                              NaN NaN NaN];

end