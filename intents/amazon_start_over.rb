intent "Amazon.StartOverIntent" do
  response_text = "OK, what movie would you like to know about?"
  ask(response_text, start_over: true)
end
