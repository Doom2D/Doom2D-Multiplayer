//when player presses the use key
with trg_atuse
{
  if collision_rectangle(other.x - 16, other.y - 20,
                         other.x + 16, other.y + 31, id, 0, 0) { event_user(0); }
}
