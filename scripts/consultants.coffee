sentences = [
	"Of a consultant, he says: A perfectly bilingual Consultant is the perfect Consultant..",
	"Of a consultant, he says: His reponse is within 30 minutes as such is the importance of the success of his clients to him..",
	"Of a consultant, he says: He has played in organized sport for competitive swimming, baseball, basketball, ice-hockey, soccer, football, track-and-field, cross-country running, volleyball, badminton, Sa Long Cuong kung fu, boxing and kick-boxing. He has won tournaments in basketball, soccer, and numerous tournaments in volleyball..",
	"Of a consultant, he says: He delved into the technology world to great depths, in his personal life and in his University education, and today combines that knowledge with knowledge gained in sociology and psychology courses taken in his Undergrad from the University of Bishop's, and today is a pre-eminent leading Consultant how this truly affects people on young people and the evolving *older* young person..",  
	"Of a consultant, he says: His reponse is within 30 minutes as such is the importance of the success of his clients to him.. ",
  "Of a consultant, he says: Le consultant idéal connaît aussi la technique PCMD..",




]

module.exports = (robot) ->
	robot.hear /(.*)(consultant)(.*)/i, (msg) ->
			msg.send msg.random sentences 
