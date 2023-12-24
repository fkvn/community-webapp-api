package mono.thainow.service;

import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.guideBook.GuideBookCategory;
import mono.thainow.rest.response.SearchResponse;

public interface SearchService {

    //    SearchResponse<?> searchCompany(String industry, String keywords, double centerLat,
    //                                    double centerLng, int limit, int page, String sort,
    //                                    String sortOrder, String within, int radius,
    //                                    List<Double> topLeft, List<Double> bottomRight);
    //
    //    SearchResponse<?> searchDealPost(Long requesterId, Long ownerId, String category,
    //                                     String keywords, double centerLat, double centerLng,
    //                                     int limit,
    //                                     int page, String sort, String sortOrder, String within,
    //                                     int radius, List<Double> topLeft, List<Double>
    //                                     bottomRight,
    //                                     String status);
    //
    //    SearchResponse<?> searchJobPost(Long requesterId, Long ownerId, String keywords,
    //                                    String position, String experience, String skills,
    //                                    Boolean remote, double centerLat, double centerLng, int
    //                                    limit,
    //                                    int page, String sort, String sortOrder, String within,
    //                                    int radius, List<Double> topLeft, List<Double>
    //                                    bottomRight,
    //                                    String status);
    //
    //    SearchResponse<?> searchHousingPost(Long requesterId, Long ownerId, String keywords,
    //                                        String type, String costType, Double minCost,
    //                                        Double maxCost, Integer guest, Integer bed, Integer
    //                                        parking,
    //                                        Integer bath, String amenity, String category,
    //                                        double centerLat, double centerLng, int limit, int
    //                                        page,
    //                                        String sort, String sortOrder, String within, int
    //                                        radius,
    //                                        List<Double> topLeft, List<Double> bottomRight,
    //                                        String status);
    //
    //    SearchResponse<?> searchMarketplacePost(Long requesterId, Long ownerId, String keywords,
    //                                            String condition, String category, Double minCost,
    //                                            Double maxCost, double centerLat, double
    //                                            centerLng,
    //                                            int limit, int page, String sort, String
    //                                            sortOrder,
    //                                            String within, int radius, List<Double> topLeft,
    //                                            List<Double> bottomRight, String status);
    //
    //    SearchReviewResponse<?> searchPostReview(Long id, String sort, String sortOrder, int
    //    limit,
    //                                             int page, Long profileId);
    //
    //    SearchReviewResponse<?> serachProfileReview(Long id, String sort, String sortOrder, int
    //    limit,
    //                                                int page);

    SearchResponse<?> searchGuideBookPost(Long profileId, Long requesterId, String keywords,
                                          GuideBookCategory category, int limit, int page,
                                          String sortBy, String sortByOrder, PostStatus status);

    SearchResponse<?> searchGuideBook(Long profileId, Long requesterId, String keywords,
                                      GuideBookCategory category, int limit, int page,
                                      String sortBy, String sortByOrder, PostStatus status);
}
