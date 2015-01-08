desc "Create example posts for testing"
namespace :examples do
  task posts: :environment do
    user = User.first

    ["lost", "found", "adoption"].each do |state|
      post = user.posts.new

      post.title        = (state == "lost") ? "Perdido" : (state == "found") ? "Encontrado" : "En Adopcion"
      post.description  = state
      post.state        = state
      post.status       = "active"
      post.contact      = "test@test.com"
      post.location     = "Holanda 3019, Ñuñoa, Santiago"
      post.animal_type  = "cat"
      post.breed        = "kiltro"
      post.age          = "60"

      post.save!
    end
  end
end