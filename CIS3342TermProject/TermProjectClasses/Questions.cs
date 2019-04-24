using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TermProjectClasses
{
    public class Questions
    {
        private int questionOne;
        private int questionTwo;
        private int questionThree;
        private string questionOneAnswer;
        private string questionTwoAnswer;
        private string questionThreeAnswer;

        public Questions() { }

        public int QuestionOne { get => questionOne; set => questionOne = value; }
        public int QuestionTwo { get => questionTwo; set => questionTwo = value; }
        public int QuestionThree { get => questionThree; set => questionThree = value; }
        public string QuestionOneAnswer { get => questionOneAnswer; set => questionOneAnswer = value; }
        public string QuestionTwoAnswer { get => questionTwoAnswer; set => questionTwoAnswer = value; }
        public string QuestionThreeAnswer { get => questionThreeAnswer; set => questionThreeAnswer = value; }
    }
}
