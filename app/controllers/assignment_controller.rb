class AssignmentController < ApplicationController
  before_action :set_course, only: [:show, :new, :destroy]
  before_action :authenticate_user!
  before_action :assignment_owner, only: [:new, :destroy] 
#  before_action :set_assignment, only: [:show]
  # GET /courses
  # GET /courses.json
  def index
    @assignments = Assignment.all
    @enrollments = Enrollment.all
    @courses = Course.all 
    respond_to do |format|
      format.html
      format.pdf do
        submission = AssignmentIdPdf.new(@assignments)
        send_data submission.render, filename: @assignment.name + '.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @assignment = Assignment.find(params[:id])
#    @enrollment = Enrollment.where(:course_id => @course.id)
 #   @course = Course.where(:course_id => @course.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AssignmentIdPdf.new(@course)
        send_data pdf.render, filename: "Assignment_#{@assignment.name}.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /courses/new
  def new
    @assignment = current_user.assignments.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @assignments = current_user.assignments.new(assignment_params)
    @assignments.course_id = @course.id
    @assignments.user_id = current_user
    respond_to do |format|
      if @course.save
        format.html { redirect_to assignment_show_path, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    # @course.user = current_user
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to assignment_show_path, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @assignment.user = current_user
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignment_index_path, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Check Course owner
    def assignment_owner
      if @assignment.present?
        unless (@assignment.user_id == current_user.id && current_user.member?) || current_user.admin?
          flash[:alert] = "You don't have authorization!"
          redirect_to @assignment
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:_id])
    end
   
    def set_course
      @course = Course.where(:id => :course_id)
    end
 
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit( :grade, :course_id, :user_id, :title, :description, :status, :proposed_date, :deadline, 
                                          submissions_attributes: [:id, :document, :_destroy ])
    end
end
