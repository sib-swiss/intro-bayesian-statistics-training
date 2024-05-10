
local_mean <- mean(local_samples)
local_sd <- sd(local_samples)
local_se <- local_sd/sqrt(length(local_samples))
xs_temp <- 10*c(-500:500)/1000
ys_temp <- dt(xs_temp, length(local_samples) - 1)
xs <- local_mean + local_se*xs_temp
ys <- ys_temp/local_se
df2 <- data.frame(xs, ys)
yscale <- 1/(sqrt(2*pi)*local_se)
conf_interval <- t.test(local_samples)$conf.int
p_val <- t.test(local_samples)$p.value
local_t <- 0

pp <- ggplot() + theme_bw() + theme(text = element_text(size = 18))

if (internalFlag==TRUE) {
  pp <- pp + geom_area(data = df2, mapping = aes(x = xs, y = ys), colour = "dodgerblue",
              linewidth = 1, fill = "dodgerblue", alpha = 0.33)
} else {
  pp <- pp + geom_area(data = df2, mapping = aes(x = xs, y = ys), colour = "darkorchid4",
                       linewidth = 1, fill = "darkorchid4", alpha = 0.33)
}

pp <- pp + geom_vline(xintercept = 0, colour = "dodgerblue", linetype = 1, linewidth = 1) +
    geom_vline(xintercept = local_mean, colour = "darkorchid4", linetype = 2, linewidth = 2) +
    xlab("m") + ylab("density") + ylim(0, 1.25*yscale)

if (internalFlag==TRUE) {
  pp <- pp + geom_vline(xintercept=conf_interval[1], colour = "darkorchid4", 
                        linetype = 3, linewidth = 1) +
  geom_vline(xintercept = conf_interval[2], colour = "darkorchid4", linetype = 3, linewidth = 1)
  pp <- pp + geom_area(data = subset(subset(df2, xs > conf_interval[1]), xs < conf_interval[2]), 
                       mapping = aes(x = xs, y = ys), colour = "darkorchid4", linewidth = 1, fill = "darkorchid4", alpha = 0.33)
  pp <- pp + annotate("text", label = paste0(round(conf_interval[2], 3), "]"), x = xs[850], y = ys[400], size = 8)
  pp <- pp + annotate("text", label = paste0("[", round(conf_interval[1], 3), ","), x = xs[150], y = ys[400], size = 8)
} 

if (internalFlag2==TRUE) {
  pp <- pp + annotate("text", label = paste0("p = ", signif(p_val, 3)), x = xs[765], y = ys[500], size = 8)
}

  
print(pp)
