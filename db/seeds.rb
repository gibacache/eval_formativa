Course.create!([
  {number: "MAT101", name: "Didactica de las matemáticas 1"}
])
Tree.create!([
  {course_id: 1, label: "Video 1", first_node_id: 3, n_repeat: 3}
])
ArgumentativeQuestion.create!([
  {question: "Esta es la pregunta 1.1", answer1: "bien", answer2: "mal", answer3: "mal", answer4: "mal", argument1: "bien", argument2: "mal", argument3: "mal", argument4: "mal", correct_answer: 1, correct_argument: 1, feedback_wrong_argument: "F 1.1 ✔✘", feedback_wrong: "F 1.1 ✘✘"},
  {question: "Esta es la pregunta 1.2", answer1: "bien", answer2: "mal", answer3: "mal", answer4: "mal", argument1: "mal", argument2: "bien", argument3: "mal", argument4: "mal", correct_answer: 1, correct_argument: 2, feedback_wrong_argument: "F 1.2  ✔✘", feedback_wrong: "F 1.2 ✘✘"},
  {question: "Esta es la pregunta 2", answer1: "mal", answer2: "bien", answer3: "mal", answer4: "mal", argument1: "bien", argument2: "mal", argument3: "mal", argument4: "mal", correct_answer: 2, correct_argument: 1, feedback_wrong_argument: "F 2 ✔✘", feedback_wrong: "F 2 ✘✘"}
])

Node.create!([
  {tree_id: 1, label: "2", questionable_id: 3, questionable_type: "ArgumentativeQuestion", next_node_correct_id: nil, next_node_wrong_id: 1},
  {tree_id: 1, label: "1.2", questionable_id: 2, questionable_type: "ArgumentativeQuestion", next_node_correct_id: 1, next_node_wrong_id: 2},
  {tree_id: 1, label: "1.1", questionable_id: 1, questionable_type: "ArgumentativeQuestion", next_node_correct_id: 1, next_node_wrong_id: 2},
])
