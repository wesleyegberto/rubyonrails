class PeopleController < ApplicationController
  before_action :getPerson, only: [:show, :edit, :update, :destroy]

  # action to index, list all people
  def index
  	@people = Person.all
  end

  # action to new person, is called before render the view
  def new
  end

  def getPerson
    @person = Person.find(params[:id])
  end

  #action to show a specific person, is called before render the view
  def show
  	if !@person
  		flash[:message] = "Person not found"
  	end
  	render action: "edit"
  end

  #action to edit a specific person, is called before render the view
  def edit
  end

  #action to save the person on database
  def create
  	#@person = Person.new(params[:person]) #create a new person
  	@person = Person.new(post_params) #create a new person using security post
  	if @person.save #save the person in database, but the rails' feature strong_parameteres doesn't allow to save without specify the fields those are accepted
  		redirect_to @person
	else
		flash[:type] = "warning"
  		flash[:message] = "Please, complete the required fields"
		render "new"
	end
  end

  #action to update the person on database
  def update
  	if @person.update(post_params)
		flash[:type] = "success"
  		flash[:message] = "Saved successfully"
  		redirect_to @person
	else
		flash[:type] = "warning"
  		flash[:message] = "Please, complete the required fields"
		render "edit"
	end
  end

  #action to delete the person from database
  def destroy
  	if @person.destroy
		flash[:type] = "success"
  		flash[:message] = "Deleted successfully"
  		redirect_to people_path
	else
		flash[:type] = "warning"
  		flash[:message] = "Person wasn't deleted"
		render "edit"
	end
  end

  private
  	def post_params
  		#method params returns an ActiveSupport::HashWithIndifferentAccess
  		params.require(:person).permit(:name, :age)
  	end

end
