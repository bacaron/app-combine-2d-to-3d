# app-combine-2d-to-3d

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Reconstructs a single high-resolution 3D T2-weighted volume from 3 stacks of 2D T2-weighted slices (axial, coronal and sagittal) using NiftyMIC super-resolution volume reconstruction.**

Runs niftymic_reconstruct_volume (NiftyMIC) on 3 T2-weighted slice stacks acquired in different orientations (axial, coronal and sagittal) and combines them into one motion-corrected 3D volume. Use it when only thick-slice 2D acquisitions are available and a single isotropic-like volume is needed for further analysis. All stacks must belong to the same subject and session; intermediate files (motion-correction transforms, masks, NiftyMIC configs) are kept in a separate raw output.

| | |
|---|---|
| 📥 **Inputs** | `neuro/anat/t2w` ×3 |
| 📤 **Outputs** | `neuro/anat/t2w` · `raw` |
| 🐳 **Container** | `renbem/niftymic` |
| ⚙️ **Resources** | 4 CPUs · 32 GB memory · 7.5 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.698](https://doi.org/10.25663/brainlife.app.698) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `first_input` | `neuro/anat/t2w` | yes | Stack of 2D T2-weighted slices acquired in the axial orientation. |
| `second_input` | `neuro/anat/t2w` | yes | Stack of 2D T2-weighted slices acquired in the coronal orientation. |
| `third_input` | `neuro/anat/t2w` | yes | Stack of 2D T2-weighted slices acquired in the sagittal orientation. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/anat/t2w` | Reconstructed 3D T2-weighted volume (NIfTI named <type>.nii.gz). |
| `raw` | `raw` | NiftyMIC intermediate files: motion-correction folder, stack masks and the config JSON files. |

<details>
<summary><b>⚙️ Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `type` | string | `t2` | Base name of the reconstructed output file (written as <type>.nii.gz); should match the output datatype (t1 or t2). |

</details>

<!-- brainlife-app:end -->

    [EbnerWang2020] Ebner, M., Wang, G., Li, W., Aertsen, M., Patel, P. A., Aughwane, R., Melbourne, A., Doel, T., Dymarkowski, S., De Coppi, P., David, A. L., Deprest, J., Ourselin, S., Vercauteren, T. (2020). An automated framework for localization, segmentation and super-resolution reconstruction of fetal brain MRI. NeuroImage, 206, 116324.
    [EbnerWang2018] Ebner, M., Wang, G., Li, W., Aertsen, M., Patel, P. A., Melbourne, A., Doel, T., David, A. L., Deprest, J., Ourselin, S., Vercauteren, T. (2018). An Automated Localization, Segmentation and Reconstruction Framework for Fetal Brain MRI. In Medical Image Computing and Computer-Assisted Intervention -- MICCAI 2018 (pp. 313–320). Springer.
    [Ebner2018] Ebner, M., Chung, K. K., Prados, F., Cardoso, M. J., Chard, D. T., Vercauteren, T., Ourselin, S. (2018). Volumetric reconstruction from printed films: Enabling 30 year longitudinal analysis in MR neuroimaging. NeuroImage, 165, 238–250.
    Daniel Sobotka, Michael Ebner, Ernst Schwartz, Karl-Heinz Nenning, Athena Taymourtash, Tom Vercauteren, Sebastien Ourselin, Gregor Kasprian, Daniela Prayer, Georg Langs, Roxane Licandro. Motion correction and volumetric reconstruction for fetal functional magnetic resonance imaging data, NeuroImage, Volume 255, 2022, 119213, ISSN 1053-8119, https://doi.org/10.1016/j.neuroimage.2022.119213.
