library(rslurm)

out_dir <- "/ourdisk/hpc/geocarb/boomtree/test/"

test_func <- function(par_mu, par_sd, job, out_dir) {
  samp <- rnorm(10^6, par_mu, par_sd)
  out  <- cbind(s_mu = mean(samp), s_sd = sd(samp))
  write.csv(out, paste0(out_dir, "job", job, ".csv"), row.names = FALSE)
}

pars <- data.frame(par_mu = 1:10, par_sd = seq(0.1, 1, length.out = 10), job = 1:10)

sjob <- slurm_apply(test_func, pars, out_dir = out_dir, jobname = 'test_apply',
                    nodes = 10, cpus_per_node = 1, submit = TRUE,
                    slurm_options = list(
                      partition = "geocarb_plus"))
get_job_status(sjob)[2]
cleanup_files(sjob)