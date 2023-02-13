import os
import sys

class Dictionary():
        # Dictionary class
        class Language():
                # Language Dictionary
                class Japanese():
                        # Japanese Language Dictionary
                        def __init__(self):
                                self.grammar = {
                                        "wa" : "is",
                                        "ga" : "is",
                                        "no" : "of; belongs to",
                                        "ni" : "to somewhere far away",
                                        "he" : "to somewhere nearby",
                                        "de" : "at someplace"
                                }
                                self.vocabulary = {
                                        # English word : ["romanji", "kanji", "hirogana", "katakana"]
                                        "departure" : ["tabidachi"]
                                }
                                self.sentence = {

                                }
                                self.connectors = {

                                }
                        
                class French():
                        # French Language Dictionary
                        def __init__(self):
                                self.grammar = {
                                        "et" : "and"
                                }
                                self.numbers = {
                                        "1" : "un",
                                        "2" : "deux",
                                }
                                self.vocabulary = {
                                        "poisson" : "fish",
                                        "pomme" : "potato",
                                        "pomme de terre" : "apple",
                                        "terre" : "ground"
                                }
                                self.sentence = {

                                }
                                self.connectors = {

                                }

def testbench():
        """
        Testbench
        """
        # Import Dictionary class
        d = Dictionary()

        # Import Language class 
        l = d.Language()

        # Import Japanese Language Dictionary class
        jp = l.Japanese()

        # Import French Language Dictionary class
        fr = l.French()

        grammars = {
                "Japanese" : jp.grammar,
                "French" : fr.grammar,
        }

        vocab = {
                "Japanese" : jp.vocabulary,
                "French" : fr.vocabulary
        }

        japanese = [
                grammars["Japanese"],
                vocab["Japanese"]
        ]

        french = [
                grammars["French"],
                vocab["French"]
        ]

        print("Japanese")
        for jpinfo in japanese:
                for k,v in jpinfo.items():
                        print("{} : {}".format(k,v))

        print("")

        print("French")
        for frinfo in french:
                for k,v in frinfo.items():
                        print("{} : {}".format(k,v))


def main():
        testbench()

def debug():
        print("Hello World!")
        
        print("")

        main()

if __name__ == "__main__":
        debug()
