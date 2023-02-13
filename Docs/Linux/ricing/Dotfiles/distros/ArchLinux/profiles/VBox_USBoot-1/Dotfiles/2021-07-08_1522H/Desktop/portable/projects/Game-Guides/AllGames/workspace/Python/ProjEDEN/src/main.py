import os
import sys

class DigimonStoryCybersleuthCE():
    def __init__(self):
        # Master Class
        self.cs_List = [
                "stats", "Cybersleuth", "HackersMemory"
        ]
        self.digi_rank_Tree = [
                "In-Training",
                "Rookie",
                "Champion",
                "Ultimate",
                "Mega",
                "Ultra"
        ]

    class stats():
        # Statistic Calculations
        def check_ABI(self, curr_Rank, next_Rank, curr_Lv, type="Digivolve"):
            """
            Check ABI
            ::Params
            ::  curr_Rank
            ::      data type: String
                    default argument: NIL
                    use-case ; Your digimon's current rank (i.e. In-Training, Rookie, Champion, Ultimate, Mega, Ultra)
            ::  next_Rank
                    data type: String
                    default argument: NIL
                    use-case : Your digimon's next rank (Digivolve: In-Training -> Rookie; degeneration: Rookie -> In-Training
            ::  curr_Lv
            ::      data type: Integer/String
                    default argument: NIL
                    use-case : Your digimon's current level
            ::  type
                    data type: String
                    default argument: "Digivolve"
                    use-case: The type of change digimon (Digivolution/Degeneration)
            """
            status = "N/A"
            bonus = 1
            ret = {}
            if type == "Digivolve":
                # If Digivolving
                if ( (curr_Lv % 10) == 0 ):
                    # Divisible by 10
                    # Digivolve
                    status = "OK"
                    bonus = (curr_Lv / 10)

                    if curr_Rank == "In-Training":
                        bonus += 1
                    elif curr_Rank == "Rookie":
                        bonus += 2

            elif type == "Degeneration":
                if ( (curr_Lv % 10) == 0 ) or ( (curr_Lv % 5) == 0 ):
                    # Divisible by 10 or Divisible by 5
                    # Degenerate
                    status = "OK"
                    bonus = (curr_Lv / 5)

            ret["status"] = status
            ret["bonus"] = bonus
            return ret

    class Cybersleuth():
        def __init__(self):
            # Cybersleuth Class Only
            self.cs_List = []

    class HackersMemory():
        def __init__(self):
            # Cybersleuth: Hackers Memory
            self.cs_List = []

digi = DigimonStoryCybersleuthCE()
digiStats = digi.stats()
cs = digi.Cybersleuth()
hm = digi.HackersMemory()

def main():
    print("Game Guides")
    def digivolution(digimon_Details, evo_Details):
        ### Digivolution Check ### 
        """
        digimon_Details = {
            "name" : "Test",
            "rank" : "In-Training",
            "level" : 90,
            "change" : "Digivolve"
        }

        evo_Details = {
            "name" : "Test",
            "new_rank" : "Rookie"
        }
        """
        digimon_Name = digimon_Details["name"]
        digimon_Rank = digimon_Details["rank"]
        curr_Level = digimon_Details["level"]
        change_Type = digimon_Details["change"]
        digimon_new_Rank = evo_Details["new_rank"]

        print("Details:")
        print(" Name: {}\n \
Current Level: {}\n \
Rank Change: {} -> {}\n \
Change Status: {}".format(digimon_Name, curr_Level, digimon_Rank, digimon_new_Rank, change_Type)
        )

        # Digivolution
        res = digiStats.check_ABI(digimon_Rank, digimon_new_Rank, curr_Level, change_Type)

        print("Results:")
        for k,v in res.items():
            print(" {} : {}".format(k,v))

    def degeneration(digimon_Details, evo_Details):
        ### Degeneration Check ###
        """
        digimon_Details = {
            "name" : "Test",
            "rank" : "Rookie",
            "level" : 95,
            "change" : "Degeneration"
        }

        evo_Details = {
            "name" : "Test",
            "new_rank" : "In-Training"
        }
        """
        digimon_Name = digimon_Details["name"]
        digimon_Rank = digimon_Details["rank"]
        curr_Level = digimon_Details["level"]
        change_Type = digimon_Details["change"]
        digimon_new_Rank = evo_Details["new_rank"]

        print("Details:")
        print(" Name: {}\n \
Current Level: {}\n \
Rank Change: {} -> {}\n \
Change Status: {}".format(digimon_Name, curr_Level, digimon_Rank, digimon_new_Rank, change_Type)
        )

        # Degeneration
        res = digiStats.check_ABI(digimon_Rank, digimon_new_Rank, curr_Level, change_Type)

        print("Results:")
        for k,v in res.items():
            print(" {} : {}".format(k,v))


    # === TestBench === #
    print("[Digivolution]")
    digimon_digivolve_Details = {
        "name" : input("Digimon Name: "),
        "rank" : input("Digimon Rank: "),
        "level" : input("Digimon Level: "),
        "change" : input("Digimon Change Type (Digivolve | Degeneration): ")
    }

    evo_Details = {
        "name" : digimon_digivolve_Details["name"],
        "new_rank" : input("Next Digimon Rank: ")
    }
    digivolution(digimon_digivolve_Details, evo_Details)

    print("===")

    print("[Degeneration]")
    digimon_degenerate_Details = {
       "name" : input("Digimon Name: "),
       "rank" : input("Digimon Rank: "),
       "level" : input("Digimon Level: "),
       "change" : input("Digimon Change Type (Digivolve | Degeneration): ")
    }

    degenerate_Details = {
        "name" : digimon_degenerate_Details["name"],
        "new_rank" : ""
    }
    degeneration(digimon_degenerate_Details, degenerate_Details)

if __name__ == "__main__":
    main()

