%deflection of bridge
for n=0:5
vertices_bottom1=[(n*L) 0 0;L+(n*L) 0 0; L+(n*L) W 0;0+(n*L) W 0];
vertices_top1=[0+(n*L) 0 W; L+(n*L) 0 W; L+(n*L) W W;0+(n*L) W W];
vertex_matrix_bar1=[vertices_bottom1;vertices_top1];
patch('Vertices',vertex_matrix_bar1,'Faces',face_matrix_bar,'FaceColor',[0 0 0]);
end
for n=1:5
    vertices_bottom3=[0+(n*L) 0 0;W+(n*L) 0 0; W+(n*L) W 0;0+(n*L) W 0];
vertices_top3=[0+(n*L) 0 L; W+(n*L) 0 L; W+(n*L) W L;0+(n*L) W L];
vertex_matrix_bar3=[vertices_bottom3;vertices_top3];
% n starts from 1 since no vertical bar at nodeo
 patch('Vertices',vertex_matrix_bar3,'Faces',face_matrix_bar,'FaceColor',[colour(1,p) 0 (1-colour(1,p))]);
end
 for n=[0 3 4]

vertices_bottom5=[0+(n*L) 0 0; W+(n*L) 0 0; W+(n*L) W 0; 0+(n*L) W 0];
vertices_top5= [0+((n+1)*L) 0 L; W+((n+1)*L) 0 L; W+((n+1)*L) W L; 0+((n+1)*L) W L]; 
vertex_matrix_bar5=[vertices_bottom5;vertices_top5];
 patch('Vertices',vertex_matrix_bar5,'Faces',face_matrix_bar,'FaceColor',[colour(1,p) 0 (1-colour(1,p))]);
 end
 for n=[1 2 5]
vertices_bottom7=[0+((n+1)*L) 0 0; W+((n+1)*L) 0 0; W+((n+1)*L) W 0; 0+((n+1)*L) W 0];
vertices_top7= [0+((n)*L) 0 L
    ; W+((n)*L) 0 L; W+((n)*L) W L; 0+((n)*L) W L]; 
vertex_matrix_bar7=[vertices_bottom7;vertices_top7];
 patch('Vertices',vertex_matrix_bar7,'Faces',face_matrix_bar,'FaceColor',[colour(1,p) 0 (1-colour(1,p))]);
 end