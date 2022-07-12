# Created by use_targets().

# Load packages required to define the pipeline:
library(targets)

# Set target options:
tar_option_set(
  # packages that your targets need to run
  packages = c("palmerpenguins", "ggplot2", "tidymodels"),
  format = "rds" # default storage format
  # Set other options as needed.
)

# define functions here or in a other R files that are sourced.
create_plot <- function(data) {
  ggplot(data) +
    geom_point(aes(y = body_mass_g, x = flipper_length_mm, color = species)) +
    theme_bw(24)
}

# Add the "targets" as a list
list(
  # Our first target borrows the `penguins` dataset
  tar_target(raw_data, penguins),

  tar_target(lm_spec, linear_reg() %>%
               set_mode("regression") %>%
               set_engine("lm")),

  tar_target(rec_spec_interact,
             recipe(body_mass_g ~ flipper_length_mm + bill_depth_mm,
                    data = raw_data) %>%
               step_interact(~ flipper_length_mm:bill_depth_mm)),

  tar_target(lm_wf_interact,
             workflow() %>%
               add_model(lm_spec) %>%
               add_recipe(rec_spec_interact)),

  tar_target(our_plot, create_plot(raw_data)),

  tar_target(fit, lm_wf_interact %>% fit(raw_data))
)

# Now you can run this with `targets::tar_make()`
# You can retrieve results from the `_targets/` data store using `tar_read()` or `tar_load()`.
# The `targets` dependency graph helps your readers understand the steps of your pipeline at a high level.
# Run this with `targets::tar_visnetwork()`
