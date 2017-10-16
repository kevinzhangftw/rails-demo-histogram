class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def normalize
    puts "normalizing"
    # TODO: update database
    course_id =  params[:course_id]
    @course = Course.find(course_id)
    @course.enrolls.each do |enrollment|
      enrollment.lettergrade = new_grades(enrollment.percentage, params)
      enrollment.save!
    end
    render json: @course.enrolls
  end

  def new_grades(percentage, brackets)
    puts brackets
    puts "assigning........"
    l0 = brackets[:l0].to_i
    l1 = brackets[:l1].to_i
    l2 = brackets[:l2].to_i
    l3 = brackets[:l3].to_i
    l4 = brackets[:l4].to_i
    l5 = brackets[:l5].to_i
    l6 = brackets[:l6].to_i
    l7 = brackets[:l7].to_i
    l8 = brackets[:l8].to_i
    l9 = brackets[:l9].to_i
    l10 = brackets[:l10].to_i
    l11 = brackets[:l11].to_i
    if percentage < l0 && percentage >= l1
      return "A+"
    end
    if percentage < l1 && percentage >= l2
      return "A"
    end
    if percentage < l2 && percentage >= l3
      return "A-"
    end
    if percentage < l3 && percentage >= l4
      return "B+"
    end
    if percentage < l4 && percentage >= l5
      return "B"
    end
    if percentage < l5 && percentage >= l6
      return "B-"
    end
    if percentage < l6 && percentage >= l7
      return "C+"
    end
    if percentage < l7 && percentage >= l8
      return "C"
    end
    if percentage < l8 && percentage >= l9
      return "C-"
    end
    if percentage < l9 && percentage >= l10
      return "D"
    end
    if percentage < l10 && percentage >= l11
      return "F"
    end
  end
  # GET /courses/1
  # GET /courses/1.json
  def show
	   @allenrolls = @course.enrolls

  end

  def submit
    @maxbound = params[:l0]
    unless @maxbound.blank?
       render '/index'
    end
    @aplusbound = params[:l1]
    unless @aplusbound.blank?
       render '/index'
    end
    @bplusbound = params[:l1]
    unless @bplusbound.blank?
       render '/index'
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_id, :name, :description)
    end
end
