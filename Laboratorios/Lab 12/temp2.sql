ALTER TABLE entregan add constraint cfentreganRFC 
  foreign key (RFC) references Proveedores(RFC)

  ALTER TABLE entregan add constraint cfentreganNumero
  foreign key (Numero) references Proyectos(Numero)