class AssignmentPdf < Prawn::Document

  def initialize(assignment)
    super()
    @assignments = Assignment.all
    @user = User.where(:user_id => @assignments.user_id)
    assignment_table
  end

  def assignment_table
    table assignment_all do
      row(0).font_style = :bold
      columns(1..3).align = :center
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
    end
  end

  def assignment_all
    [["Title", "Description", "Instructor"]] +
    @assignment.map do |course|
      [assignment.title, assignment.description, @user.name]
    end
  end

end
