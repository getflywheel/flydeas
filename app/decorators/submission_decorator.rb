require "delegate"

class SubmissionDecorator < SimpleDelegator
  include ImageLinkHelper
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Context
  include ActionView::Helpers::DateHelper

  def display_vote_link(current_user, color_image = false)
    vote = get_vote_count(current_user)
    if vote.nil? || vote.weight == 0
      path = submission_vote_path(submission_id: id, user_id: current_user.id, weight: 1)
      vote_type = 'upvote'
      image_name = color_image ? "chevron_up-gray.svg" : "chevron_up.svg"
    else
      path = submission_vote_path(submission_id: id, user_id: current_user.id, weight: 0)
      vote_type = 'unvote'
      image_name = color_image ? "chevron_up-yellow.svg" : "chevron_up.svg"
    end
    return image_link(path, :patch, image_name, image_options: {alt: vote_type.capitalize, size: "20x20"}, link_options: {class: vote_type, id: vote_type})
  end

  def set_submission_class_id(current_user)
    vote = get_vote_count(current_user)
		submission_class_id = "hasNotVoted"
		if vote.nil?
			submission_class_id = "hasNotVoted"
		elsif vote.weight == 1
			submission_class_id = "hasVoted"
    end
    return submission_class_id
  end

  def set_submission_status
    status = self.status.name
    if self.status.name == "Open"
      status = "openTag"
    elsif self.status.name == "Completed"
      status = "closedTag"
    else
      status = "rejectedTag"
    end
    return status
  end

  def comment_vote_link(submission, current_user)
    vote = get_vote_count(current_user)
    if vote.nil? || vote.weight == 0 
      path = submission_comment_vote_path(submission_id: submission, comment_id: self, user_id: current_user, weight: 1)
      vote_type = "upvote"
    else
      path = submission_comment_vote_path(submission_id: submission, comment_id: self, user_id: current_user, weight: 0)
      vote_type = "unvote"
    end
    return image_link(path, :patch, "chevron_up.svg", image_options: {alt: vote_type.capitalize, size: "20x20"}, link_options: {class: vote_type, id: vote_type})
  end

  def comment_details(submission, current_user)
    if user == current_user
	    return %(You posted #{time_ago_in_words(created_at)} ago |
	      #{link_to "Delete", submission_comment_path(submission_id: submission.id, id: id), method: :delete, data: { confirm: "Are you sure?" }, class:'form__link'}).html_safe
    else
      return "#{user.username} posted #{time_ago_in_words(created_at)} ago"
    end
  end

  private
  def get_vote_count(current_user)
    vote_count = Vote.find_by(post: id, user_id: current_user.id)
  end
end
