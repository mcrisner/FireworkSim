# FireworkSim
A firework simulator based on Newtonian mechanics.

# Instructions

Execute the EXE (Windows only) or open the file in Processing and click Run. Feel the patriotism running through your veins.

If experiencing lag, decrease the particleMultiplier value at the top of the main file.

# Technical Details

This simulation is intended to depict a firework show based on Newtonian mechanics. It consists of a Firework class, which launches a particle into
the air with a random initial velocity. This particle is affected by the force of gravity and a drag force. Once the
firework's vertical velocity slows past a randomly generated threshold, it explodes, generating a random number of
particles based on the size of the explosion.

Each generated particle is an object of the Particle class, which obeys the same physical rules as the Firework class (i.e. gravity and drag). These Particles have randomly generated initial velocities going outward from the point of explosion. They slow down due to the drag force and fall downward due to gravity. They also gradually darken after the explosion until they are fully black, at which point they despawn. Both Fireworks and Particles are drawn as small circles with a random color.
