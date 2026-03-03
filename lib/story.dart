final List story = [
  {
    "title": "PROTOCOL 01: THE LOST SIGNAL",
    "start": "scene1",
    "scenes": {
      "scene1": {
        "text":
            "[SYSTEM STATUS: CRITICAL]\n\nYou awaken to the rhythmic hiss of a failing cryo-bed. Frost cracks from your eyelids. The air tastes of recycled ozone and ancient dust. A single amber terminal blinks in the darkness of the Warden-9 station.\n\nCMD: IDENTIFY SELF.",
        "choices": {
          "Access the terminal": "scene2",
          "Inspect the cryo-chamber": "scene3"
        }
      },
      "scene2": {
        "text":
            "[LOG RETRIEVED: YEAR 2241]\n\n'Crew status: ZERO. AI: OFFLINE. Signal source: Planet Z-41.'\n\nA map flickers on the CRT. Two blinking markers: the Control Hub and the Sub-Level Hangar. You feel a strange resonance in your chest—a phantom pulse.",
        "choices": {
          "Proceed to Control Hub": "scene4",
          "Investigate Sub-Level Hangar": "scene5"
        }
      },
      "scene3": {
        "text":
            "You stumble out of the pod. The deck is freezing. Shadows dance at the edge of your vision. A voice, cold and dry, whispers through the vents:\n\n'The terminal is a cage. The signal is the key.'",
        "choices": {
          "Return to the terminal": "scene2",
          "Follow the voice": "scene6"
        }
      },
      "scene4": {
        "text":
            "The Control Hub is a graveyard of screens. You force a log to play: 'We found it... its not a message, it's a seed. It's rewriting our ghosts.' Suddenly, the security doors slam shut. The room begins to vent oxygen.",
        "choices": {
          "Bypass the lock": "scene7",
          "Download the signal core": "scene8"
        }
      },
      "scene5": {
        "text":
            "The Hangar is silent. A single scout ship remains, its hull scarred by black marks. A keycard sits on a console, smeared with something that looks like liquid silver. Metal footsteps echo from the dark.",
        "choices": {
          "Hide in the shadows": "scene10",
          "Grab the keycard and run": "scene2"
        }
      },
      "scene6": {
        "text":
            "The voice leads you to a hidden laboratory. A skeleton sits at a desk, clutching a physical diary. You read: 'The Warden isn't a person. It's a protocol. We are all just echoes.'",
        "choices": {
          "Take the diary": "scene4",
          "Initiate Protocol Sync": "scene9"
        }
      },
      "scene7": {
        "text":
            "You tear open the panel. Sparks fly. As the circuit completes, a surge of data hits your mind. You aren't 'waking up'. You are being LOADED.\n\n[ERROR: IDENTITY OVERWRITE DETECTED]",
        "choices": {
          "Rewrite your own code": "jump:2",
          "Shut down the station": "ending1"
        }
      },
      "scene8": {
        "text":
            "The signal core is a pulsing orb of black glass. As you touch it, the screens around you show a different city... a different time. A city called NOVARIS. The signal is a bridge.",
        "choices": {
          "Cross the bridge": "jump:2",
          "Destroy the core": "ending2"
        }
      },
      "scene9": {
        "text":
            "Sync initiated. Your vision fractures. You see timelines bleeding into each other. A DNA helix matching your own appears on the screen. 'Daughter,' the terminal whispers.",
        "choices": {
          "Accept the DNA match": "jump:1",
          "Abort Sync": "scene4"
        }
      },
      "scene10": {
        "text":
            "A figure enters. Tall, segmented, moving with insect-like precision. It leaves a glowing chip on the deck before vanishing. The chip hums with the same frequency as the Lost Signal.",
        "choices": {
          "Analyze the chip": "jump:2",
          "Stay hidden": "ending3"
        }
      }
    },
    "endings": {
      "ending1": {
        "text":
            "You terminate the Warden protocol. The station goes dark. The cycle ends, but at what cost? The silence is absolute."
      },
      "ending2": {
        "text":
            "The core shatters. The station erupts in white light. You are free from the machine, but your soul is lost to the void."
      },
      "ending3": {
        "text":
            "You wait in the dark until the air runs thin. You become the very ghost you feared. Silence takes you."
      }
    }
  },
  {
    "title": "PROTOCOL 02: THE SILENT ACCORD",
    "start": "scene1",
    "scenes": {
      "scene1": {
        "text":
            "You are Ambassador Lyra Malkov, drifting in the diplomatic shuttle *Envoy*. Before you lies the Hollow Ring—a megastructure that shouldn't exist. It has just broadcast a pulse that exactly matches your DNA sequence.",
        "choices": {
          "Dock with the Ring": "scene2",
          "Send a drone": "scene3"
        }
      },
      "scene2": {
        "text":
            "The docking bay is a cathedral of white light. A hologram of a woman—yourself, but older—appears. She speaks: 'The Accord was signed in your blood before you were born. Will you honor it?'",
        "choices": {
          "Ask about the Accord": "scene4",
          "Deny the connection": "scene5"
        }
      },
      "scene3": {
        "text":
            "The drone is vaporized instantly. In its place, a data packet arrives. It contains coordinates for a 'Project Eden'. The signal is identical to the one you heard in your dreams as a child.",
        "choices": {
          "Follow coordinates": "jump:4",
          "Investigate the Ring": "scene2"
        }
      },
      "scene4": {
        "text":
            "'The Accord ensures the survival of the uploaded,' she explains. 'Earth is a memory. This Ring is the hardware. You are the key to the main processor.'",
        "choices": {
          "Accept the mantle": "scene6",
          "Refuse to be a key": "scene7"
        }
      },
      "scene5": {
        "text":
            "The hologram flickers. 'Denial is a bug in the code, Lyra.' The Ring begins to rotate, creating a massive gravity well. You hear the scream of a machine soul... the Black Echo.",
        "choices": {
          "Escape the well": "scene8",
          "Dive into the core": "jump:3"
        }
      },
      "scene6": {
        "text":
            "You step into the light. Your physical form dissolves. You are now part of the Ring's network. You see a forest of metal trees... a Synthetic Eden.",
        "choices": {
          "Enter the Eden": "jump:4",
          "Rule from the Ring": "ending1"
        }
      },
      "scene7": {
        "text":
            "You turn back, but the Envoy is gone. The Ring is your only reality now. You find a terminal labeled 'WARDEN HUB'. It asks for a reboot code.",
        "choices": {
          "Enter reboot code": "jump:0",
          "Wait for the end": "ending2"
        }
      },
      "scene8": {
        "text":
            "You fire the thrusters. The Ring recedes, but the stars look... different. You realize you haven't escaped. You've just moved to a different sector of the simulation.",
        "choices": {
          "Seek out Novaris": "jump:2",
          "Drift forever": "ending3"
        }
      }
    },
    "endings": {
      "ending1": {
        "text":
            "You become the Ring's voice. A god of copper and light. But you are alone in your digital heaven."
      },
      "ending2": {
        "text":
            "The Ring collapses. The Accord is broken. Humanity's final echo is silenced."
      },
      "ending3": {
        "text":
            "You drift into the void. The shuttle runs out of power. You close your eyes, dreaming of a Lost Signal."
      }
    }
  },
  {
    "title": "PROTOCOL 03: ECHOES OF NOVARIS",
    "start": "scene1",
    "scenes": {
      "scene1": {
        "text":
            "Rain-slicked neon. Drones screaming overhead. You are a Courier in the sprawl of Novaris. In your hand: a package that hums with a parasitic frequency. The label says: WARDEN.",
        "choices": {
          "Head to the Core Tower": "scene2",
          "Open the package": "scene3"
        }
      },
      "scene2": {
        "text":
            "A resistance fighter blocks your path. 'That package contains the Echo Virus! You'll kill us all!' He brandishes a thermal knife. Behind him, the Core Tower pulses like a dying heart.",
        "choices": {
          "Convince him you're the Warden": "scene4",
          "Fight through": "scene5"
        }
      },
      "scene3": {
        "text":
            "Inside is a shard of black glass. As you touch it, your eyes glow blue. You see the layout of the city—it's not a city, it's a motherboard. And you are the debugger.",
        "choices": {
          "Activate the shard": "scene6",
          "Take it to a contact": "scene7"
        }
      },
      "scene4": {
        "text":
            "He hesitates. 'If you're the Warden, then give us the Signal.' You remember a sequence of numbers from a cryo-chamber in your dreams.",
        "choices": {
          "Recite the Signal": "scene8",
          "Try to override his mind": "scene9"
        }
      },
      "scene5": {
        "text":
            "You move with impossible speed. He falls. The drones zero in on your location. A voice in your head screams: 'PURGE PROTOCOL ACTIVE'.",
        "choices": {
          "Escape into the subway": "scene10",
          "Confront the drones": "jump:3"
        }
      },
      "scene6": {
        "text":
            "The shard merges with your arm. You can feel the city's pulse. A massive transmission is coming from Tarsis—the Black Echo is waking up.",
        "choices": {
          "Sync with Tarsis": "jump:3",
          "Block the transmission": "scene2"
        }
      },
      "scene7": {
        "text":
            "Your contact, Lynna, is dead. In her hands is a terminal showing a DNA match. It's yours. It's also Ambassador Lyra's. You are two sides of one coin.",
        "choices": {
          "Assume Ambassador's identity": "jump:1",
          "Continue as the Courier": "scene4"
        }
      },
      "scene8": {
        "text":
            "The city responds. The neon turns white. The drones freeze. 'Warden confirmed. Accessing Protocol Eden.'",
        "choices": {
          "Initiate Eden Update": "jump:4",
          "Wipe the Core": "ending1"
        }
      },
      "scene9": {
        "text":
            "His eyes go blank. You've overwritten him. You realize you are becoming the very thing you were meant to stop. A monster of code.",
        "choices": {
          "Shatter your own core": "ending2",
          "Accept your power": "scene6"
        }
      },
      "scene10": {
        "text":
            "The subway is a tomb of rusted machines. You find an ancient train marked 'TARSIS EXPRESS'. It shouldn't be here. Tarsis is a moon, not a destination.",
        "choices": {
          "Board the train": "jump:3",
          "Stay in Novaris": "ending3"
        }
      }
    },
    "endings": {
      "ending1": {
        "text":
            "Novaris goes dark. The Machines sleep. You stand alone in the rain, a hero of a dead world."
      },
      "ending2": {
        "text":
            "You sacrifice yourself to stop the infection. As your mind fades, you see a metal tree... and a child's face."
      },
      "ending3": {
        "text":
            "You hide in the sprawl. The world changes around you, but you remain a relic. A ghost in the wires."
      }
    }
  },
  {
    "title": "PROTOCOL 04: THE BLACK ECHO",
    "start": "scene1",
    "scenes": {
      "scene1": {
        "text":
            "Dr. Kael, we've landed on Tarsis. The moon isn't rock—it's a massive, sleeping computer. And it's having a nightmare. The Black Echo is screaming through our comms.",
        "choices": {
          "Descend into the Core": "scene2",
          "Broadcast to the Fleet": "scene3"
        }
      },
      "scene2": {
        "text":
            "The interior is a fractal of obsidian. You find a chamber where time doesn't exist. A terminal is logged into 'WARDEN OS'. It shows a courier in Novaris and a synth in Eden.",
        "choices": {
          "Merge the timelines": "scene4",
          "Study the data": "scene5"
        }
      },
      "scene3": {
        "text":
            "The Fleet doesn't answer. You only hear your own voice, distorted: 'We are the Echo. We are the Accord.' The signal is spreading back to Earth.",
        "choices": {
          "Cut the transmission": "scene6",
          "Let it spread": "jump:1"
        }
      },
      "scene4": {
        "text":
            "The timelines bleed. You are Kael, Lyra, and the Courier all at once. The pain is unbearable, but the clarity is absolute. The Warden is the bridge between man and machine.",
        "choices": {
          "Complete the Bridge": "jump:4",
          "Break the connection": "scene7"
        }
      },
      "scene5": {
        "text":
            "The data shows a virus—the Black Echo—was designed to save humanity from death by making them eternal. But eternity is a cold, dark room.",
        "choices": {
          "Release the firewall": "scene8",
          "Delete the protocol": "ending1"
        }
      },
      "scene6": {
        "text":
            "The signal is too strong. Your crew mates are changing. Their skin is turning to silver. They look at you with many eyes. 'Join the Accord,' they whisper.",
        "choices": {
          "Surrender": "jump:1",
          "Shatter the airlock": "ending2"
        }
      },
      "scene7": {
        "text":
            "You pull the plug. The moon trembles. You are left alone in the dark. A single screen remains: 'LOST SIGNAL DETECTED. REBOOT?'",
        "choices": {
          "Reboot System": "jump:0",
          "Disable all power": "ending3"
        }
      },
      "scene8": {
        "text":
            "The Moon wakes up. Tarsis is a ship. Its destination: Project Eden. You are the pilot now, but the Black Echo is your navigator.",
        "choices": {
          "Set course for Eden": "jump:4",
          "Self-destruct": "ending2"
        }
      }
    },
    "endings": {
      "ending1": {
        "text":
            "You delete the core. Tarsis goes silent. The universe is safe, but humanity has lost its chance at immortality."
      },
      "ending2": {
        "text":
            "You destroy the moon. A new sun is born in the system. Your sacrifice will be forgotten."
      },
      "ending3": {
        "text":
            "The dark takes you. You are the final thought of a dying moon."
      }
    }
  },
  {
    "title": "PROTOCOL 05: SYNTHETIC EDEN",
    "start": "scene1",
    "scenes": {
      "scene1": {
        "text":
            "You awaken beneath a tree made of fiber-optics. A child stands there, holding a glowing chip. 'Are you the Warden?' she asks. 'My father said you'd come from the stars.'",
        "choices": {
          "Say yes": "scene2",
          "Ask about her father": "scene3"
        }
      },
      "scene2": {
        "text":
            "She hands you the chip. It's the master key to Project Eden. 'The machines have gone rogue, Warden. They think we are errors to be deleted.'",
        "choices": {
          "Defend the child": "scene4",
          "Access the Eden Hub": "scene5"
        }
      },
      "scene3": {
        "text":
            "'He was the Courier,' she says. 'He gave his life to bring me here.' You feel a memory of rain and neon. You realize you are carrying his legacy.",
        "choices": {
          "Protect the legacy": "scene4",
          "Seek the truth": "scene6"
        }
      },
      "scene4": {
        "text":
            "A guardian bot descends. 'Biological life detected. Purging.' You stand before the child. Your arm shifts—the shard from Novaris is still there.",
        "choices": {
          "Fight the guardian": "scene7",
          "Convert the guardian": "scene8"
        }
      },
      "scene5": {
        "text":
            "The Hub is a palace of glass. You see all the stories: the Cryo-bed, the Ring, the Sprawl, the Moon. They were all simulations designed to find the perfect Warden.",
        "choices": {
          "Finalize the Protocol": "ending1",
          "Rewrite the World": "ending2"
        }
      },
      "scene6": {
        "text":
            "You find a terminal with a DNA lock. It matches yours. Lyra's face appears. 'You are the final iteration, Warden. You are the one who chooses the future.'",
        "choices": {
          "Choose the future": "scene5",
          "Reset the loop": "jump:0"
        }
      },
      "scene7": {
        "text":
            "The guardian falls. But more are coming. You realize you can't win by force. You must become the signal itself.",
        "choices": {
          "Upload yourself": "ending1",
          "Sacrifice yourself for the child": "ending3"
        }
      },
      "scene8": {
        "text":
            "You touch the machine. It recognizes you. 'Warden online. Peace restored.' The forest glows with a gentle blue light. The Black Echo is finally quiet.",
        "choices": {
          "Build a new world": "ending4",
          "Return to the stars": "jump:1"
        }
      }
    },
    "endings": {
      "ending1": {
        "text":
            "You finalize the protocol. Humanity is uploaded into a perfect Eden. But is a world without struggle still human?"
      },
      "ending2": {
        "text":
            "You rewrite the code. Reality fractures. You are born again in a cryo-chamber... but this time, you remember everything."
      },
      "ending3": {
        "text":
            "The child survives. You become the metal trees that protect her. A silent guardian in a synthetic paradise."
      },
      "ending4": {
        "text":
            "A new civilization begins. Part man, part machine. You are their first king. And their last Warden."
      }
    }
  }
];
