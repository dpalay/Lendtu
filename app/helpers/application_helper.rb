module ApplicationHelper
def add_link provider, str, id
  link_to_if(current_user.identities.find_by(provider: provider).nil?, "Add #{str}",
             "/auth/#{provider}", id: id) do
    "Already a #{str} Profile" end
end
end
