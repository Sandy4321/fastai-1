

tms <- NULL
fastaudio <- NULL
AudioSpectrogram <- NULL
NoiseColor <- NULL
AudioPadType <- NULL
RemoveType <- NULL
dicom_windows <- NULL
nn <- NULL
fastai2 <- NULL
tabular <- NULL
vision <- NULL
text <- NULL
Module <- NULL
medical <- NULL
collab <- NULL
kg <- NULL
metrics <- NULL
cm <- NULL
colors <- NULL
fastaip <- NULL
Callback <- NULL
bt <- NULL
crap <- NULL
migrating_pytorch <- NULL
migrating_lightning <- NULL
migrating_ignite <- NULL
catalyst <- NULL
F <- NULL
Dicom <- NULL
retinanet <- NULL
torch <- NULL

.onLoad <- function(libname, pkgname) {

  fastai2 <<- reticulate::import("fastai", delay_load = list(
    priority = 10,
    environment = "r-fastai"
  ))

  cran_ = identical(Sys.getenv("NOT_CRAN", unset = "true"), "true")

  if(cran_) {

    py_av = reticulate::py_available(initialize = TRUE)

    if(py_av) {

      if(reticulate::py_module_available('IPython') &
         reticulate::py_module_available('torch') &
         reticulate::py_module_available('torchvision') &
         reticulate::py_module_available('fastai')) {

        # torch module
        torch <<- fastai2$torch_basics$torch

        # tabular module
        tabular <<- fastai2$tabular$all

        # vision module
        vision <<- fastai2$vision

        # collab module
        collab <<- fastai2$collab

        # text module
        text <<- fastai2$text$all

        # Torch module
        nn <<- fastai2$torch_core$nn

        # Metrics
        metrics <<- fastai2$metrics

        # Module
        Module <<- fastai2$vision$all$Module

        # Medical
        medical <<- fastai2$medical$imaging

        # windows
        dicom_windows <<- fastai2$medical$imaging$dicom_windows

        # cmap
        cm <<- fastai2$vision$all$plt$cm

        # colors
        colors <<- fastai2$vision$all$matplotlib$colors


        # callback class
        Callback <<- fastai2$callback$all$Callback

        #builtins
        bt <<- reticulate::import_builtins()

        # Functional interface
        F <<- fastai2$torch_core$F

        # Dicom
        Dicom <<- medical$PILDicom

      }

      if(reticulate::py_module_available('fastaudio')){

        # main module
        fastaudio <<- reticulate::import('fastaudio')

        # RemoveType
        RemoveType <<- fastaudio$augment$preprocess$RemoveType

        # AudioPadType
        AudioPadType <<- fastaudio$augment$signal$AudioPadType

        # NoiseColor
        NoiseColor <<- fastaudio$augment$signal$NoiseColor

        # AudioSpectrogram
        AudioSpectrogram <<- fastaudio$core$spectrogram$AudioSpectrogram
      }

      if(reticulate::py_module_available('fastprogress')) {
        # remove fill
        fastaip <<- reticulate::import('fastprogress')

        fastaip$progress_bar$fill = ''
      }


      if(reticulate::py_module_available('kaggle')) {
        kg <<- reticulate::import('kaggle')
      }

      if(reticulate::py_module_available('timeseries_fastai')) {
        tms <<- reticulate::import('timeseries_fastai')
      }


      if(reticulate::py_module_available('ignite') &
         reticulate::py_module_available('pytorch_lightning') &
         reticulate::py_module_available('catalyst')) {

        if(file.exists('fastaibuilt/crappify.py')) {
          crap <<- reticulate::import_from_path('crappify', path = 'fastaibuilt')
        }

        if(file.exists('fastaibuilt/migrating_ignite.py')) {
          migrating_ignite <<- reticulate::import_from_path('migrating_ignite', path = 'fastaibuilt')
        }

        if(file.exists('fastaibuilt/migrating_lightning.py')) {
          migrating_lightning <<- reticulate::import_from_path('migrating_lightning', path = 'fastaibuilt')
        }

        if(file.exists('fastaibuilt/migrating_pytorch.py')) {
          migrating_pytorch <<- reticulate::import_from_path('migrating_pytorch', path = 'fastaibuilt')
        }

        if(file.exists('fastaibuilt/migrating_catalyst.py')) {
          catalyst <<- reticulate::import_from_path('migrating_catalyst', path = 'fastaibuilt')
        }

        if(dir.exists('fastaibuilt/retinanet')) {
          retinanet <<- reticulate::import_from_path('retinanet', path = 'fastaibuilt')
        }

      }

    }
  }
}



