vert = [0 1 1;0 2 1;1 2 1;1 1 1];

%There are only two faces, defined by connecting the vertices in the order indicated.

fac = [1 2 3;1 3 4];

%To specify the face colors, define a 2-by-3 matrix containing two RGB color definitions.

tcolor = [1 1 1;.7 .7 .7];

%With two faces and two colors, MATLAB can color each face with flat shading. This means you must set the FaceColor property to flat, since the faces/vertices technique is available only as a low-level function call (i.e., only by specifying property name/property value pairs).

%Create the patch by specifying the Faces, Vertices, and FaceVertexCData properties as well as the FaceColor property.

patch('Faces',fac,'Vertices',vert,'FaceVertexCData', tcolor,'FaceColor','flat');