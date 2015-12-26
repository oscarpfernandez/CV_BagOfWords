function [label,model,llh]=build_voc_gmm(points_total,size)

[label,model,llh]=emgm(points_total',size);
end