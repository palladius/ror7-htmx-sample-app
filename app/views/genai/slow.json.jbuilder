# FROM CONTROLLER: render :show, action: 'click', answer: @answer

#json.partial! "posts/post", post: @post
return {
  boh: "prova domani",
  answer: @answer,
  sobenme: @sobenme,
  picture: image_tag('sebastian.jpg'),
}
#json.extract! action, answer
#json.extract! post, :id, :title, :body, :published, :created_at, :updated_at
#json.url post_url(post, format: :json)
#json.extract! @answer, :sobenme
