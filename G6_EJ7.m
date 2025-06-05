#ejercicio 7 guia 6
x=[0:200:1200];
rho=[4 3.95 3.89 3.80 3.60 3.41 3.30];
Ac=[100 103 106 110 120 133 149.6];

m_s=simpsoncomp(x,rho.*Ac)
m_t=trapcomp(x,rho.*Ac)

dif_rel=abs(m_s-m_t)/abs(m_t)
