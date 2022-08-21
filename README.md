# rslurm_test
Scripts for testing parallel processing with R and slurm.

rslurm works like the parallel package. You pass to a function a list or data frame of parameters, and the slurm_apply function will assign each call (row in your df) to a core... where you specify how many nodes you want and cores per node.

## To activate R module on schooner

1. Find versions of R installed on the sever using: module avail R/
2. Type: module load R/version_you_want

## To view installed R packages:
1. Type: R
2. Type: library()

## To install package locally
1. Type: R
2. Type: install.packages(c("rslrum"))
3. If you get prompts about personal library install, type y

## How to run
1. Upload your script to your desired location on the server.
2. Type: Rscript rslurm_test.R
