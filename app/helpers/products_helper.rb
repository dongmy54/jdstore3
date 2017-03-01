module ProductsHelper
def is_commenter?(comments)
    if current_user.blank?
      return true
     else  
           commenter = comments.find_by_commenter(current_user.email)
           if commenter.blank?
               return true
            else
               return false
            end
    end
  end	
end
