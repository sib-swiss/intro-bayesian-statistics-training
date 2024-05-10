xs <- 10*c(-500:500)/1000
ys <- dt(xs, df = input$studentt_nu)
yscale <- 1/sqrt(2*pi)
if (internalFlag == TRUE) {
  xs <- xs*input$studentt_s
  ys <- ys/input$studentt_s
  yscale <- yscale/input$studentt_s
}
df <- data.frame(xs, ys)
pp <- ggplot() +
  ylab("Probability density") +
  ylim(0, 1.25*yscale) +
  geom_area(data = df, aes(xs, ys), colour = "dodgerblue", linewidth = 1, fill = "dodgerblue",
            alpha = 0.33) +
  geom_point(colour = "dodgerblue", size = 2) +
  theme_bw(base_size = 18)
if (internalFlag == FALSE) {
  pp <- pp + xlab("t")
if (input$normal_show) {
  ys2 <- dnorm(xs)
  df2 <- data.frame(xs, ys2)
  pp <- pp + geom_line(data = df2, aes(xs, ys2), colour = "darkorange", linewidth = 2, alpha = 0.67) 
}
} else {
  pp <- pp + xlab(expression(mu)) + xlim(c(-5, 5))
}
print(pp)
