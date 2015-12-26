function voc=build_voc_kmeans(points_total,size)

    voc=vl_kmeans(points_total',size,'verbose','distance', 'l1', 'algorithm', 'elkan');
    voc=voc';

end