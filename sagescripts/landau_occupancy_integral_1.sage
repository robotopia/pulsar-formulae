var('gamma theta')

f = gamma^(5/2)*sqrt(gamma^2 - 1)*exp(-gamma/theta)
assume(theta>0)
f_approx = f.taylor(gamma, oo, 1)

F_approx = integrate(f_approx, gamma, 1, oo)
F_powerlaw = 12*theta^4.5

# Plot
# p1 = plot_loglog(F_approx, (theta, 0.1, 100))
# p2 = plot_loglog(F_powerlaw, (theta, 0.1, 100), linestyle="--", color="red")
# p1 + p2
