function Export3ColsDataCore(FP,DataPackage)

fid = fopen(FP,'w');
fprintf(fid,'    % .5f             % .5E             % .5E\n',(DataPackage.ProfileForDrawing));
fclose(fid);