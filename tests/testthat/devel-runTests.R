
## SET UP ----

  # Install required packages
  ## Required because module is not an R package
  install.packages(
    c("testthat", "SpaDES.core", "SpaDES.project"),
    repos = unique(c("predictiveecology.r-universe.dev", getOption("repos"))))


## OPTIONS ----

  # Test repo branches instead of local submodules
  options("spades.test.modules" = c(
    CBM_core            = "PredictiveEcology/CBM_core@development",
    CBM_defaults        = "PredictiveEcology/CBM_defaults@development",
    CBM_vol2biomass_RIA = "PredictiveEcology/CBM_vol2biomass_RIA@development",
    CBM_dataPrep_RIA    = "PredictiveEcology/CBM_dataPrep_RIA@development"
  ))

  # Suppress warnings from calls to setupProject, simInit, and spades
  options("spades.test.suppressWarnings" = TRUE)
  
  # Set custom directory paths
  ## Speed up tests by allowing inputs, cache, and R packages to persist between runs
  options("spades.test.paths.inputs"   = NULL) # inputPath
  options("spades.test.paths.cache"    = NULL) # cachePath
  options("spades.test.paths.packages" = NULL) # packagePath

  # Test recreating the Python virtual environment
  ## WARNING: this will slow down testing, avoid unless Python is having issues
  Sys.setenv(RETICULATE_VIRTUALENV_ROOT = file.path(tempdir(), "virtualenvs"))


## RUN ALL TESTS ----

  # Run all tests
  testthat::test_dir("tests/testthat")

  # Run all tests with different reporters
  testthat::test_dir("tests/testthat", reporter = testthat::LocationReporter)
  testthat::test_dir("tests/testthat", reporter = testthat::SummaryReporter)


## RUN INDIVIDUAL TESTS ----
  
  ## Run all RIA-small tests
  testthat::test_dir("tests/testthat", filter = "RIA-small")
  
  
  ## Run RIA-small 2015
  testthat::test_file("tests/testthat/test-RIA-small_t1-2015.R")
  
  ## Run RIA-small 1985-2015
  testthat::test_file("tests/testthat/test-RIA-small_t2-1985-2015.R")

  ## Run RIA 2015
  testthat::test_file("tests/testthat/test-RIA_t1-2015.R")
  
  ## Run RIA 1985-2015
  testthat::test_file("tests/testthat/test-RIA_t2-1985-2015.R")
  
  
  
  
  

