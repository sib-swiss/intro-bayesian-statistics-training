
local_mean <- mean(local_samples)
local_sd <- sd(local_samples)
local_se <- local_sd/sqrt(length(local_samples))
xs <- local_mean + 10*local_se*c(-500:500)/1000
ys <- dnorm(xs, mean = local_mean, sd = local_se)
df2 <- data.frame(xs, ys)

pp <- ggplot() + theme_bw() + theme(text = element_text(size = 18)) +
    geom_area(data = df2, mapping = aes(x = xs, y = ys), colour = "darkorchid4",
              linewidth = 1, fill = "darkorchid4", alpha = 0.33) +
    geom_vline(xintercept = 0, colour = "dodgerblue", linetype = 1, linewidth = 1) +
    geom_vline(xintercept = local_mean, colour = "darkorchid4", linetype = 2, linewidth = 2) +
    xlab("x") + ylab("density")
if (!input$rescaleADJ) {
  pp <- pp + xlim(-3, 3)
}
print(pp)
