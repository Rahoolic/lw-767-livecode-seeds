url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts 'destroy all existing movies...'
Movie.destroy_all

movies['results'].each do |result|
  Movie.create!(
    title: result['title'],
    overview: result['overview'],
    rating: result['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500#{result['poster_path']}"
  )

  # Advanced way of logging seeds errors
  # begin
  #   Movie.create!(
  #     title: title
  #   )
  # rescue ActiveRecord::RecordInvalid
  #   puts "error inserting #{title}"
  # end
end

puts 'done! 🍿'
