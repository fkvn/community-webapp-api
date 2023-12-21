package mono.thainow.service.impl;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.guideBook.GuideBook;
import mono.thainow.domain.post.guideBook.GuideBookPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.exception.BadRequest;
import mono.thainow.repository.PostRepository;
import mono.thainow.rest.request.NewGuideBookPostRequest;
import mono.thainow.rest.request.PatchGuideBookPostRequest;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.service.GuideBookService;
import mono.thainow.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import static org.apache.commons.lang3.StringUtils.isBlank;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    GuideBookService guideBookService;

    @Autowired
    private PostDao postDao;

    @Autowired
    private PostRepository postRepository;


    //	=============================================================

    @Override
    public List<Post> findPostsByProfile(Profile profile) {
        return postDao.findPostsByProfile(profile);
    }

    @Override
    public Post findPostById(Long id) {
        return postRepository.findByIdAndStatusNot(id, PostStatus.REMOVED).get();
    }


    //	=============================================================


    @Override
    public void activatePost(Post post) {
        // post will be in private once it is activated again
        // owner would need to set it to public if needed
        post.setStatus(PostStatus.PRIVATE);
        savePost(post);
    }

    @Override
    public Post createPost(Profile owner, PostRequest request) {
        Post newPost = null;

        switch (request.getPostType()) {
            //            case DEAL_POST: {
            //                Deal deal = dealService.createDeal((DealRequest) request);
            //                newPost = new DealPost(owner, deal);
            //            }
            //            break;
            //            case JOB_POST: {
            //                Job job = jobService.createJob((JobRequest) request);
            //                newPost = new JobPost(owner, job);
            //            }
            //            break;
            //            case HOUSING_POST: {
            //                Housing housing = housingService.createHousing((HousingRequest)
            //                request);
            //                newPost = new HousingPost(owner, housing);
            //            }
            //            break;
            //            case MARKETPLACE_POST: {
            //                Marketplace marketplace =
            //                        marketplaceService.createMarketplace((MarketplaceRequest)
            //                        request);
            //                newPost = new MarketplacePost(owner, marketplace);
            //            }
            //            break;
            case GUIDEBOOK_POST: {
                GuideBook guideBook = ((NewGuideBookPostRequest) request).getGuideBook();
                if (guideBook == null) throw new BadRequest("GuideBook information is required!");
                if (isBlank(guideBook.getTitle()))
                    throw new BadRequest("GuideBook Title is required!");
                if (guideBook.getCategory() == null)
                    throw new BadRequest("GuideBook Category is required!");

                // merge db
                guideBook = guideBookService.saveGuideBook(guideBook);

                // merge db
                newPost = new GuideBookPost(owner, guideBook);

                try {
                    newPost = savePost(newPost);
                } catch (Exception e) {
                    // rollback if errors occur
                    guideBookService.deleteGuideBook(guideBook);
                    throw e;
                }

            }
            break;
            default:
                throw new BadRequest("Failed to create new post!");
        }

        return newPost;
    }

    @Override
    public void patchPost(Post post, PostRequest request) {

        Optional.ofNullable(request.getIsPostAsAnonymous()).ifPresent(post::setPostAsAnonymous);
        Optional.ofNullable(request.getNotificationVia()).ifPresent(post::setNotificationVia);

        switch (post.getType()) {
            case GUIDEBOOK_POST: {

                PatchGuideBookPostRequest patchGuideBookPostRequest =
                        (PatchGuideBookPostRequest) request;

                if (patchGuideBookPostRequest.getGuideBook() != null) {
                    GuideBookPost guideBookPost = (GuideBookPost) post;

                    GuideBook patchedGuideBook =
                            guideBookService.patchGuideBook(guideBookPost.getGuideBook(),
                                    patchGuideBookPostRequest.getGuideBook());

                    guideBookPost.setGuideBook(patchedGuideBook);
                }

            }
            break;
            //            case DEAL_POST: {
            //                dealService.updateDeal(((DealPost) post).getDeal(), (DealRequest)
            //                request);
            //            }
            //            break;
            //            case JOB_POST: {
            //                jobService.updateJob(((JobPost) post).getJob(), (JobRequest) request);
            //            }
            //            break;
            //            case HOUSING_POST: {
            //                housingService.updateHousing(((HousingPost) post).getHousing(),
            //                        (HousingRequest) request);
            //            }
            //            break;
            //            case MARKETPLACE_POST: {
            //                marketplaceService.updateMarketplace(((MarketplacePost) post)
            //                .getMarketplace(),
            //                        (MarketplaceRequest) request);
            //            }
            //            break;
            default:
                break;
        }

        savePost(post);

    }

    @Override
    public void disablePost(Post post) {
        // soft disabled and doesn't affect the dependency, such as blockers or reviews.
        post.setStatus(PostStatus.DISABLED);
        savePost(post);
    }

    @Override
    public void removePost(Post post) {
        // soft deleted and doesn't affect the dependency, such as blockers or reviews.
        post.setStatus(PostStatus.REMOVED);
        savePost(post);
    }

    @Override
    public void deletePost(Post post) {
        postRepository.delete(post);
    }

    @Override
    public Post savePost(Post post) {
        return postRepository.save(post);
    }
}
