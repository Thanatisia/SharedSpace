import os
import sys
from importlib import import_module

class Imports():
        def import_selflib(self,module_Name):
                module = import_module(module_Name)
                return module
  
        def import_multilib(self,*module_Names):
                """
                ::Params
                        module_Names
                        Type: Tuple
                        Desc: Stores/Parses all the modules the user wants to import
                """
                # Make module_Names tuple editable
                module_Names = list(module_Names)

                # Local Variable
                module_Container = []

                # Loop & Get individual modules to import
                for mods in range(len(module_Names)):
                        curr_Module = import_module(mods)
                        module_Container.append(curr_Module)

                return module_Container

        def tensorflow(self):
                global tf
                tf = self.import_selflib("tensorflow")
                return tf


class PracticeGround():
        """
        class for all Concept testing; Idea test etc.
        """
        def __init__(self):
                self.classes = ["MachineLearningTestBench"]
        class MachineLearningTestBench():
                def __init__(self):
                        print("Initiating Machine Learning TestBench")
                class Tensorflow():
                        def __init__(self):
                                self.module_Vers="2.0"
                                print("Using Tensorflow {}".format(self.module_Vers))
                                cs_imports.tensorflow()

                        def intro(self):
                                # tf = import_selflib("tensorflow")
                                mnist = tf.keras.datasets.mnist
                                (x_train, y_train), (x_test, y_test) = mnist.load_data()
                                x_train, x_test = x_train / 255.0, x_test / 255.0
                                model = tf.keras.models.Sequential([
                                        tf.keras.layers.Flatten(input_shape=(28,28)),
                                        tf.keras.layers.Dense(128, activation='relu'),
                                        tf.keras.layers.Dropout(0.2),
                                        tf.keras.layers.Dense(10)
                                ])
                                predictions = model(x_train[:1]).numpy()
                                predictions
                                tf.nn.softmax(predictions).numpy()
                                loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
                                loss_fn(y_train[:1], predictions).numpy()
                                model.compile(optimizer='adam', loss=loss_fn, metrics=['accuracy'])
                                model.fit(x_train, y_train, epochs=5)
                                model.evaluate(x_test, y_test, verbose=2)
                                probability_model = tf.keras.Sequential([model, tf.keras.layers.Softmax()])
                                probability_model(x_test[:5])
                                print("Probability Model:\n {}".format(probability_model))

                        class Tests():
                                #def __init__(self):
                                #        self.tf = import_selflib("tensorflow")

                                def basics(self):
                                        # tf = imports.tensorflow()
                                        msg = tf.constant("Hello, TensorFlow 2.0!")
                                        tf.print(msg)


class TestBench():
        """
        TestBench class for all testing of modules, functions, classes 
        that are to be deployed/practiced.
        """
        def __init__(self):
                self.classes = []

def init():
        """
        Initialize variables, functions etc. on startup
        """
        # Globalize class variables
        global cs_imports, cs_pg, cs_mltb, cs_tf, cs_tf_Tests, cs_tb

        # Processing
        print("Initializing")

        # Step 1: Variables
        all_Classes = {
                "cs_imports" : Imports,
                "cs_pg" : PracticeGround,
                "cs_mltb" : PracticeGround.MachineLearningTestBench,
                "cs_tf" : PracticeGround.MachineLearningTestBench.Tensorflow,
                "cs_tf_Tests" : PracticeGround.MachineLearningTestBench.Tensorflow.Tests,
                "cs_tb" : TestBench,
        }
        
        
        # Step 2: Classes
        cs_imports = Imports()
        cs_pg = PracticeGround()
        cs_mltb = cs_pg.MachineLearningTestBench()
        cs_tf = cs_mltb.Tensorflow()
        cs_tf_Tests = cs_tf.Tests()
        cs_tb = TestBench()


def setup():
        """
        Setup processes, initialization etc. on startup
        """

        # Step 1: Initialization of Variables
        init()

        # Step 2:

def main():
        print("Hello World!")
        cs_tf_Tests.basics()


if __name__ == "__main__":
        setup()
        main()

