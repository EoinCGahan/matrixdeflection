FrameNumber = 100;
VideoObject = VideoWriter('bridegdefelction.avi');
open(VideoObject);
view(0,0)
axis equal
axis off
xlim([0 30])
zlim([-2 6])
W=0.12;
L=4.5;
p=1;

Max_force=1;
colour=1;
M=200;
face_matrix_bar=[1 2 3 4;1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 5 6 7 8 ];
for x=0:27
    view(0,0)
    axis equal
    axis off
    xlim([0 30])
zlim([-2 6])
   
    handlefig = figure();
   novertsc = 24;
    wheelbase = 4.2;
    totalwidth = 4.3;
    wheelradius = .5;
    wheelwidth = .2;
   
    wheelloc = [1+x 0.1 wheelradius; 1+x totalwidth-wheelwidth wheelradius; wheelbase+x 0.1 wheelradius; wheelbase+x totalwidth-wheelwidth wheelradius];
    wheelloc(:,1) = wheelloc(:,1);
theta = [0 : (2*pi)/novertsc: 2*pi*(1-(1/novertsc))];
for m =1:4
        wheelverts = zeros(novertsc*2, 3);
        for n = 1:novertsc
            wheelverts(n,1) = wheelradius*cos(theta(n));
            wheelverts(n,3) = wheelradius*sin(theta(n));
            wheelverts(n+novertsc,:) = wheelverts(n,:);
            wheelverts(n+novertsc,2) = wheelwidth;
        end
        wheelverts(1:novertsc*2,:) = wheelverts(1:novertsc*2,:) + wheelloc(m,:);
        icoord = wheelverts(:,1);
        jcoord = wheelverts(:,2);
        Kcoord = wheelverts(:,3);
        for n = 1:novertsc-1
           i = [icoord(n); icoord(n+1); icoord(n+1+novertsc); icoord(n+novertsc)];
           j = [jcoord(n); jcoord(n+1); jcoord(n+1+novertsc); jcoord(n+novertsc)];
           K = [Kcoord(n); Kcoord(n+1); Kcoord(n+1+novertsc); Kcoord(n+novertsc)];
           patch(i,j,K, 'k', 'LineStyle','none', 'FaceLighting', 'phong') 
        end
        i = [icoord(1); icoord(novertsc); icoord(2*novertsc); icoord(novertsc+1)];
        j = [jcoord(1); jcoord(novertsc); jcoord(2*novertsc); jcoord(novertsc+1)];
        K = [Kcoord(1); Kcoord(novertsc); Kcoord(2*novertsc); Kcoord(novertsc+1)];
        patch(i,j,K, 'k', 'LineStyle','none', 'FaceLighting', 'phong')
        iF = icoord(1:novertsc);
        jf = jcoord(1:novertsc);
        Kf = Kcoord(1:novertsc);

        ib = icoord(novertsc+ 1:2*novertsc);
        jb = jcoord(novertsc+ 1:2*novertsc);
        kb = Kcoord(novertsc+ 1:2*novertsc);

        patch(iF, jf, Kf, 'k', 'LineStyle','none', 'FaceLighting', 'phong');
        patch(ib, jb, kb, 'k', 'LineStyle','none', 'FaceLighting', 'phong');
    end 
axis equal
axis off
xlim([0 30])
zlim([-2 6])
      view(0,0)
     vertices_bottomback=[0+x 0.5 0.5;3.75+x 0.5 0.5;3.75+x 3.5 0.5;0+x 3.5 0.5];
vertices_topback=[0+x 0.5 2.75;3.75+x 0.5 2.75;3.75+x 3.5 2.75;0+x 3.5 2.75];
vertex_matrix_truckback=[vertices_bottomback;vertices_topback];
patch('Vertices',vertex_matrix_truckback,'Faces',face_matrix_bar,'FaceColor',[0.8 0.8 0.8]);
%main part of truck cab
vertices_bottomcab=[3.75+x 0.6 0.5;5+x 0.6 0.5;5+x 3.4 0.5;3.75+x 3.4 0.5];
vertices_topcab=[3.75+x 0.6 2;5+x 0.6 2;5+x 3.4 2;3.75+x 3.4 2];
vertex_matrix_truckfront=[vertices_bottomcab;vertices_topcab];
patch('Vertices',vertex_matrix_truckfront,'Faces',face_matrix_bar,'FaceColor',[0.3 0.3 0.3]);
%truck cab slope roof
vertices_sloperoofbottom=[3.75+x 0.6 2;5+x 0.6 2;5+x 3.4 2;3.75+x 3.4 2];
vertices_sloperooftop=[3.75+x 0.6 2.5;4+x 0.6 2.5;4+x 3.4 2.5;3.75+x 3.4 2.5];
vertex_matrix_truckroof=[vertices_sloperoofbottom;vertices_sloperooftop];
patch('Vertices',vertex_matrix_truckroof,'Faces',face_matrix_bar,'FaceColor',[0.3 0.3 0.3]);


newF=varyforcetruck(x,Fnodes);
   onlydef=gausstodeflection(A,newF)

for n=0:5
view(0,0)
vertices_top1=[0+(n*L)+(M.*onlydef(2*(n+0.5),1)) 0 W+(M.*onlydef(2*(n+1),1)); L+(n*L)+(M.*onlydef(2*(n+1.5),1)) 0 W++(M.*onlydef(2*(n+2),1)); L+(M.*onlydef(2*(n+1.5),1))+(n*L) W W+(M.*onlydef(2*(n+2),1));(n*L)+(M.*onlydef(2*(n+0.5),1)) W W+(M.*onlydef(2*(n+1),1))];
vertices_bottom1=[0+(n*L)+(M.*onlydef(2*(n+0.5),1)) 0 (M.*onlydef(2*(n+1),1)); L+(n*L)+(M.*onlydef(2*(n+1.5),1)) 0 (M.*onlydef(2*(n+2),1)); L+(M.*onlydef(2*(n+1.5),1))+(n*L) W (M.*onlydef(2*(n+2),1));(n*L)+(M.*onlydef(2*(n+0.5),1)) W (M.*onlydef(2*(n+1),1))];

vertex_matrix_bar1=[vertices_bottom1;vertices_top1];

patch('Vertices',vertex_matrix_bar1,'Faces',face_matrix_bar,'FaceColor',[1 0 0],'LineStyle', 'none', 'FaceLighting', 'flat');

end

for n=1:5
    
    vertices_bottom3=[0+(n*L) 0 0;W+(n*L) 0 0; W+(n*L) W 0;0+(n*L) W 0];
vertices_top3=[0+(n*L) 0 L; W+(n*L) 0 L; W+(n*L) W L;0+(n*L) W L];
vertex_matrix_bar3=[vertices_bottom3;vertices_top3];
% n starts from 1 since no vertical bar at nodeo
 patch('Vertices',vertex_matrix_bar3,'Faces',face_matrix_bar,'FaceColor',[1 0 0],'LineStyle', 'none', 'FaceLighting', 'flat');
 
 
end
 for n=[0 3 4]

vertices_bottom5=[0+(n*L) 0 0; W+(n*L) 0 0; W+(n*L) W 0; 0+(n*L) W 0];
vertices_top5= [0+((n+1)*L) 0 L; W+((n+1)*L) 0 L; W+((n+1)*L) W L; 0+((n+1)*L) W L]; 
vertex_matrix_bar5=[vertices_bottom5;vertices_top5];
 patch('Vertices',vertex_matrix_bar5,'Faces',face_matrix_bar,'FaceColor',[1 0 0],'LineStyle', 'none', 'FaceLighting', 'flat');
 end
 
 for n=[1 2 5]
vertices_bottom7=[0+((n+1)*L) 0 0; W+((n+1)*L) 0 0; W+((n+1)*L) W 0; 0+((n+1)*L) W 0];
vertices_top7= [0+((n)*L) 0 L; W+((n)*L) 0 L; W+((n)*L) W L; 0+((n)*L) W L]; 
vertex_matrix_bar7=[vertices_bottom7;vertices_top7];
 patch('Vertices',vertex_matrix_bar7,'Faces',face_matrix_bar,'FaceColor',[1 0 0],'LineStyle', 'none', 'FaceLighting', 'flat');

 end
 for n=1:4
    vertices_bottom9=[(n*L) 0 L;L+(n*L) 0 L; L+(n*L) W L;0+(n*L) W L];
vertices_top9=[0+(n*L) 0 W+L; L+(n*L) 0 W+L; L+(n*L) W W+L;0+(n*L) W W+L];
vertex_matrix_bar9=[vertices_bottom9;vertices_top9];
patch('Vertices',vertex_matrix_bar9,'Faces',face_matrix_bar,'FaceColor',[1 0 0],'LineStyle', 'none', 'FaceLighting', 'flat');
 end
 for n=1:4
    vertices_bottom9=[(n*L) 0 L;L+(n*L) 0 L; L+(n*L) W L;0+(n*L) W L];
vertices_top9=[0+(n*L) 0 W+L; L+(n*L) 0 W+L; L+(n*L) W W+L;0+(n*L) W W+L];


vertex_matrix_bar9=[vertices_bottom9;vertices_top9];

patch('Vertices',vertex_matrix_bar9,'Faces',face_matrix_bar,'FaceColor',[1 0 0],'LineStyle', 'none', 'FaceLighting', 'flat');
%patch('Vertices',vertex_matrix_bar10,'Faces',face_matrix_bar,'FaceColor',[1 0 0],'LineStyle', 'none', 'FaceLighting', 'flat')
 end
  

 current_frame = getframe(handlefig);
writeVideo(VideoObject,current_frame);
close(handlefig)
end

 
 close(VideoObject)
