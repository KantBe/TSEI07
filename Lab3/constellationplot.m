function constellationplot

h = scatterplot(qammod(0,16),[],[],'bx');hold on
h = scatterplot(qammod(1,16),[],[],'bo',h);
h = scatterplot(qammod(2,16),[],[],'b+',h);
h = scatterplot(qammod(3,16),[],[],'b<',h);
h = scatterplot(qammod(4,16),[],[],'b>',h);
h = scatterplot(qammod(5,16),[],[],'b*',h);
h = scatterplot(qammod(6,16),[],[],'bs',h);
h = scatterplot(qammod(7,16),[],[],'b^',h);
h = scatterplot(qammod(8,16),[],[],'bp',h);
h = scatterplot(qammod(9,16),[],[],'bh',h);
h = scatterplot(qammod(10,16),[],[],'bd',h);
h = scatterplot(qammod(11,16),[],[],'bv',h);
h = scatterplot(qammod(12,16),[],[],'rx',h);
h = scatterplot(qammod(13,16),[],[],'ro',h);
h = scatterplot(qammod(14,16),[],[],'r+',h);
h = scatterplot(qammod(15,16),[],[],'r<',h);
title('Text characters and their modulated 16-QAM symbols')
Legend = legend('T','h','e','m','s','g','f','o','r','c','a','n','l','w','t',' ');
set(Legend, 'Location','BestOutside','Fontsize',10);

