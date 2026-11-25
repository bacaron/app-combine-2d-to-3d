<h1 align="center">combine 2d to 3d</h1>

<p align="center">
  Reconstructs a single high-resolution 3D T2-weighted volume from 3 stacks of 2D T2-weighted slices (axial, coronal and sagittal) using NiftyMIC super-resolution volume reconstruction.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.698"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.698-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Reconstructs a single high-resolution 3D T2-weighted volume from 3 stacks of 2D T2-weighted slices (axial, coronal and sagittal) using NiftyMIC super-resolution volume reconstruction.**

Runs niftymic_reconstruct_volume (NiftyMIC) on 3 T2-weighted slice stacks acquired in different orientations (axial, coronal and sagittal) and combines them into one motion-corrected 3D volume. Use it when only thick-slice 2D acquisitions are available and a single isotropic-like volume is needed for further analysis. All stacks must belong to the same subject and session; intermediate files (motion-correction transforms, masks, NiftyMIC configs) are kept in a separate raw output.

| | |
|---|---|
| **Inputs** | `neuro/anat/t2w` ×3 |
| **Outputs** | `neuro/anat/t2w` · `raw` |
| **Container** | `renbem/niftymic` |
| **Resources** | 4 CPUs · 32 GB memory · 7.5 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.698](https://doi.org/10.25663/brainlife.app.698) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `first_input` | `neuro/anat/t2w` | yes | Stack of 2D T2-weighted slices acquired in the axial orientation. |
| `second_input` | `neuro/anat/t2w` | yes | Stack of 2D T2-weighted slices acquired in the coronal orientation. |
| `third_input` | `neuro/anat/t2w` | yes | Stack of 2D T2-weighted slices acquired in the sagittal orientation. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/anat/t2w` | Reconstructed 3D T2-weighted volume (NIfTI named <type>.nii.gz). |
| `raw` | `raw` | NiftyMIC intermediate files: motion-correction folder, stack masks and the config JSON files. |

<details>
<summary><b>Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `type` | string | `t2` | Base name of the reconstructed output file (written as <type>.nii.gz); should match the output datatype (t1 or t2). |

</details>

<!-- brainlife-app:end -->

## Versions on brainlife.io

This repository hosts several Apps, each built from its own branch.

| App | Branch | Run it | Status |
|---|---|---|---|
| Combine 2D T2w images into a single 3D volume - 3 orientations | [`three-inputs-v1.0`](https://github.com/bacaron/app-combine-2d-to-3d/tree/three-inputs-v1.0) | [doi:10.25663/brainlife.app.698](https://doi.org/10.25663/brainlife.app.698) | current |
| Combine 2D T2w images into a single 3D volume - 2 orientations | [`two-inputs-v1.0`](https://github.com/bacaron/app-combine-2d-to-3d/tree/two-inputs-v1.0) | [doi:10.25663/brainlife.app.697](https://doi.org/10.25663/brainlife.app.697) | available |
| Combine 2D T1w images into a single 3D volume - 2 orientations | [`two-inputs-v1.0`](https://github.com/bacaron/app-combine-2d-to-3d/tree/two-inputs-v1.0) | [doi:10.25663/brainlife.app.696](https://doi.org/10.25663/brainlife.app.696) | available |
| Combine 2D T1w images into a single 3D volume - 3 orientations | [`three-inputs-v1.0`](https://github.com/bacaron/app-combine-2d-to-3d/tree/three-inputs-v1.0) | [doi:10.25663/brainlife.app.695](https://doi.org/10.25663/brainlife.app.695) | available |

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.698](https://doi.org/10.25663/brainlife.app.698), choose `neuro/anat/t2w`, `neuro/anat/t2w`, `neuro/anat/t2w` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/anat/t2w`, `raw`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `renbem/niftymic`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository and check out the App's branch (`git checkout three-inputs-v1.0`).
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "axial": "/path/to/first_input/axial",
       "coronal": "/path/to/second_input/coronal",
       "sagittal": "/path/to/third_input/sagittal",
       "type": "t2"
   }
   ```

3. Run `./main`.

## Troubleshooting

- **something went wrong**: Check the job log for the NiftyMIC error; make sure all inputs are slice stacks of the same subject.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Combine 2D T2w images into a single 3D volume - 3 orientations. brainlife.io App. [doi:10.25663/brainlife.app.698](https://doi.org/10.25663/brainlife.app.698)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

Maintained by [@bacaron](https://github.com/bacaron).
