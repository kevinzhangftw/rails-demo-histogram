class HistogramController < ApplicationController

  def show
    set_course
    @bounds = []
    render template: "histogram.html.erb",
      :locals => { grades_counts: grades_counts}
  end


  def submitbounds
    render json: {"submit": "grade bounds "}
  end

  def grades_counts
    grades = @course.enrolls.collect(&:lettergrade)
    counts = Hash.new 0
    grades.each do |grade|
      counts[grade] += 1
    end

    return counts
  end

  helper_method :course_id
  def course_id
    @course.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      if params[:id]
        @course = Course.find(params[:id])
      else
        @course = Course.first
      end
    end
end
