# class ReEvaluation < ActiveRecord::Base
#   establish_connection :reinvent
#   self.table_name = 'JobsDb_Evaluations'
#   self.primary_key = 'ResumeID'
#
#   def self.all
#     self.find_by_sql("select ResumeID, evaluator, avg(rating),
#     STUFF(
#     (SELECT DISTINCT ' ' + Eval
#     FROM JobsDB_Evaluations
#     WHERE [ResumeID] = a.[ResumeID] AND evaluator = a.evaluator
#     FOR XML PATH (''))
#     , 1, 1, '')  AS evals
#     from JobsDB_Evaluations a group by ResumeID, evaluator")
#   end
# end
