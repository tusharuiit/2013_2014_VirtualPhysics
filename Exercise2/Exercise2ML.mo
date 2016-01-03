within ;
model Exercise2ML

  parameter Real MS = 250;
  parameter Real MP = 70;
  parameter Real R = 2.5;
  parameter Real I = MP*R*R;
  parameter Real G = -9.81;

  Real s;
  Real v;
  Real aS;
  Real fS;
  Real phi;
  Real w;
  Real z;
  Real t;
  Real fn;
  Real fz;
  Real fP;
  Real aP;

initial equation

  s = 0;
  v = 0;
  phi = 1.25;
  w = 0;

equation
  aS = der(v);
  v = der(s);
  fS = MS*aS;
  z = der(w);
  w = der(phi);
  t = I * z;
  t = fn*R;
  fn = MP*(sin(phi)*G - cos(phi)*aP);
  fz = MP*R*w*w;
  fP + sin(phi)*fz - cos(phi)*fn - MP*aP =  0;
  aP = aS;
  fP + fS = 0;
  annotation (uses(Modelica(version="3.2")));
end Exercise2ML;

