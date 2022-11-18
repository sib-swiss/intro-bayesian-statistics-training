
local_mean <- mean(local_samples)
local_sd <- sd(local_samples)
local_se <- local_sd/sqrt(length(local_samples))
df <- data.frame(x = local_samples, ytemp = 1)
xs <- local_mean + 10*local_se*c(-500:500)/1000
ys <- dnorm(xs, mean = local_mean, sd = local_se)*sqrt(2*pi*local_se^2)
df2 <- data.frame(xs, ys)

pp <- ggplot() + theme_bw() + theme(text = element_text(size = 18)) +
    geom_histogram(data = df, mapping = aes(x = x, y = ..density..), bins = 30, colour = "darkorange", fill = "darkorange", alpha = 0.33) +
    geom_density(data = df, mapping = aes(x = x), colour = "darkorange", fill = "darkorange", alpha = 0.33) + 
    xlim(-4, 4) + ylim(0, 1.25)
pp <- pp + geom_vline(xintercept = 0, colour = "dodgerblue", linetype = 1, size = 1)
if (internalFlag == TRUE) {
  pp <- pp + geom_vline(xintercept = local_mean, colour = "darkorchid4", linetype = 2, size = 2)
  if (internalFlag2 == TRUE) {
    pp <- pp + geom_area(data = df2, mapping = aes(x = xs, y = ys), colour = "darkorchid4", size = 1, fill = "darkorchid4", alpha = 0.33)
  } else {
    pp <- pp +
      geom_segment(aes(x = local_mean, xend = local_mean + local_sd, y = exp(-1/2), yend = exp(-1/2)), 
                 arrow = arrow(length = unit(0.5, "cm")), colour = "firebrick3", size = 2) + 
      geom_segment(aes(x = local_mean, xend = local_mean - local_sd, y = exp(-1/2), yend = exp(-1/2)), 
                 arrow = arrow(length = unit(0.5, "cm")), colour="firebrick3", size = 2) +
      geom_segment(aes(x = local_mean, xend = local_mean, y = 0.95*exp(-1/2), yend = 1.05*exp(-1/2)), colour = "firebrick3", size = 2)
  }
} else {
  if (internalFlag2 == TRUE) {
    pp <- pp + geom_segment(data = df, mapping = aes(x = x, xend = x, y = 0, yend = ytemp), 
                            colour = "darkorange")
    pp <- pp + geom_point(data = df, mapping = aes(x, ytemp), 
                          colour = "darkorange", size = 3)  }
}
print(pp)
