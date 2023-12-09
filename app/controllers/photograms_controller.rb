class PhotogramsController < ApplicationController
  def index
    matching_photograms = Photogram.all

    @list_of_photograms = matching_photograms.order({ :created_at => :desc })

    render({ :template => "photograms/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_photograms = Photogram.where({ :id => the_id })

    @the_photogram = matching_photograms.at(0)

    render({ :template => "photograms/show" })
  end

  def create
    the_photogram = Photogram.new
    the_photogram.user = params.fetch("query_user")
    the_photogram.comment = params.fetch("query_comment")
    the_photogram.follow_request = params.fetch("query_follow_request")
    the_photogram.like = params.fetch("query_like")
    the_photogram.photo = params.fetch("query_photo")

    if the_photogram.valid?
      the_photogram.save
      redirect_to("/photograms", { :notice => "Photogram created successfully." })
    else
      redirect_to("/photograms", { :alert => the_photogram.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_photogram = Photogram.where({ :id => the_id }).at(0)

    the_photogram.user = params.fetch("query_user")
    the_photogram.comment = params.fetch("query_comment")
    the_photogram.follow_request = params.fetch("query_follow_request")
    the_photogram.like = params.fetch("query_like")
    the_photogram.photo = params.fetch("query_photo")

    if the_photogram.valid?
      the_photogram.save
      redirect_to("/photograms/#{the_photogram.id}", { :notice => "Photogram updated successfully."} )
    else
      redirect_to("/photograms/#{the_photogram.id}", { :alert => the_photogram.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_photogram = Photogram.where({ :id => the_id }).at(0)

    the_photogram.destroy

    redirect_to("/photograms", { :notice => "Photogram deleted successfully."} )
  end
end
