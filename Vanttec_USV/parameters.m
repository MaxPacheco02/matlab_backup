% parameters file

x_u_dot = -2.25;
y_v_dot = -23.23;
y_r_dot = -1.31;
n_v_dot = -16.41;
n_r_dot = -2.79;

xuu = 0;
yvv = -99.99;
yvr = -5.49;
yrv = -5.49;
yrr = -8.8;
nvv = -5.49;
nvr = -8.8;
nrv = -8.8;
nrr = -3.49;

m = 30;
iz = 4.1;
b = 0.41;
c = 0.78;

m_mat = [
    m-x_u_dot, 0, 0;
    0, m-y_v_dot, 0-y_r_dot;
    0, 0-n_v_dot, iz-n_r_dot];
