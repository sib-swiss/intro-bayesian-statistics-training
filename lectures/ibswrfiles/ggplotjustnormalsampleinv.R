
local_mean <- mean(local_samples)
local_sd <- sd(local_samples)
local_se <- local_sd/sqrt(length(local_samples))
xs <- 10*local_se*c(-500:500)/1000
ys <- dnorm(xs, mean = 0, sd = local_se)
df2 <- data.frame(xs, ys)

pp <- ggplot() + theme_bw() + theme(text = element_text(size = 18)) +
    geom_area(data = df2, mapping = aes(x = xs,y = ys), colour = "dodgerblue", linewidth = 1,
              fill = "dodgerblue", alpha = 0.33) +
    geom_vline(xintercept = 0, colour = "dodgerblue", linetype = 1, linewidth = 1) +
    geom_vline(xintercept = local_mean, colour = "darkorchid4", linetype = 2, linewidth = 2) +
    xlab("z") + ylab("density")
if (!local_flag) {
  pp <- pp + xlim(-3, 3)
}
if (internalFlag) {
  pp <- pp + geom_area(data = subset(df2, xs > abs(local_mean)), mapping = aes(x = xs, y = ys), colour = "darkorchid4", linewidth = 1, fill = "darkorchid4", alpha = 0.33)
  pp <- pp + geom_area(data = subset(df2, xs < -abs(local_mean)), mapping = aes(x = xs, y = ys), colour = "darkorchid4", linewidth = 1, fill = "darkorchid4", alpha = 0.33)
  pp <- pp + geom_vline(xintercept = -local_mean, colour = "darkorchid4", linetype = 3, linewidth = 1)
  pp <- pp + annotate("text", label = paste0("p = ", signif(2*pnorm(abs(local_mean), 0, local_se,lower.tail = FALSE), 3)), x = 4*local_se, y = dnorm(0.5*local_se, mean = 0, sd = local_se), size = 8)
}
print(pp)
