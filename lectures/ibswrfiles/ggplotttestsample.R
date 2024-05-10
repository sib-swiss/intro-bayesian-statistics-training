
local_mean <- mean(local_samples)
local_sd <- sd(local_samples)
local_se <- local_sd/sqrt(length(local_samples))
local_t <- local_mean/local_se
xs <- 10*c(-500:500)/1000
ys <- dt(xs, length(local_samples) - 1)
df2 <- data.frame(xs, ys)
yscale <- 1/sqrt(2*pi)

pp <- ggplot() + theme_bw() + theme(text = element_text(size = 18)) +
    geom_area(data = df2, mapping = aes(x = xs, y = ys), colour = "dodgerblue", linewidth = 1, fill = "dodgerblue", alpha = 0.33) +
    geom_vline(xintercept = 0, colour = "dodgerblue", linetype = 1, linewidth = 1) +
    geom_vline(xintercept = local_t, colour = "darkorchid4", linetype = 2, linewidth = 2) +
    xlab("t") + ylab("density") + ylim(0, 1.25*yscale)

  pp <- pp + geom_area(data = subset(df2, xs > abs(local_t)), mapping = aes(x = xs, y = ys), colour = "darkorchid4", linewidth = 1, fill = "darkorchid4", alpha = 0.33)
  pp <- pp + geom_area(data = subset(df2, xs < -abs(local_t)), mapping = aes(x = xs, y = ys), colour = "darkorchid4", linewidth = 1, fill = "darkorchid4", alpha = 0.33)
  pp <- pp + geom_vline(xintercept = -local_t, colour = "darkorchid4", linetype = 3, linewidth = 1)
  pp <- pp + annotate("text", label = paste0("p = ", signif(2*pt(abs(local_t), length(local_samples) - 1, lower.tail = FALSE), 3)), x = 3.5, y = dt(0.5, length(local_samples) - 1), size = 8)
print(pp)
