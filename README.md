# Customs


Contains ideias, scripts, cdbs and pictures for cards that I script.

## Suggestions


### Digibugs

#### Digital Lair

Continuous Spell
Xyz Monsters you control with Xyz Materials that are originally Insects cannot be targeted by opponent's card or effects.
Once per turn, if you control an Xyz Monster: you can target 1 "Digital Bug" card in your Graveyard; attach it to a Xyz monster you control
If this card leaves the field: you can special Summon 2 "Digital Bug" monsters from your hand and/or Graveyard, then change their battle position.


#### Digital Web

Continuous Trap Card

Xyz Monsters you control with Xyz Materials that are originally Insects cannot be destroyed by opponent's effects.
Once per turn: you can Special Summon 1 "Digital Bug" monster from your hand or GY, then change its battle position.
If this card leaves the field: You can special Summon 1 Insect Xyz monster from your GY, then attach 1 monster from your opponent's GY to it.


#### Second Bug Signal

Quick-Play Spell Card

Activate only if you control a "Digital Bug": Special summon 1 Digital Bug" monster from your deck, then you can change the battle position of a monster on the field
If a "Digital Bug" monster(s) you control would be destroyed, you can banish this card from your Graveyard instead.
You can only activate 1 "Second Bug Signal" per turn

#### Bug Network
Field Spell
Insect monsters you control gain 300 ATK/DEF
If your opponent Special Summons a non-Insect monster while you control an Insect Xyz Monster: he must change its battle position, otherwise that monster cannot attack this turn.
Once per turn (Quick Effect): If your opponent Special Summons exactly 1 monster from the Extra deck while you control a Insect Xyz monster:


#### Digital Bug XORoach/TORoach

Monster/Xyz/Effect/Rank 9/ ATK 3200 DEF 3000

2+ Level 9 LIGHT monsters

You can also Xyz Summon this card by detaching 1 Xyz Material from a Rank 6 or higher Insect-Type Xyz Monster you control, then using that Xyz Monster as the Xyz Material.
(Xyz Materials attached to that monster also become Xyz Materials on this card.)
When this card is Summoned: you can discard 1 card; attach any number of Xyz monsters from either player's GY to this card.
During your opponent's Standby Phase (Quick effect): you can detach 1 Xyz material from this card;
non-"Digital Bug" monsters cannot activate their effects, except monsters on the field that change their batlle position this turn.
If this card leaves the field: you can Special Summon 1 Insect Xyz monster from your GY, except "Digital Bug XORoach/TORoach" then attach 1 random card from your opponent's hand to it

### Watt

#### Wattcat

Monster/Pendulum/Tuner/Effect/LIGHT/Thunder/Level 2/ATK 300/ DEF 200/ Pendulum Scale: 1

[Pendulum Effect]
Once per turn: you can target 1 "Watt" monster you control; It can attack twice this turn.

[Monster effect]
Can attack your opponent directly.
When this card inflicts Battle Damage to your opponent by a direct attack: target 1 card your opponent controls; banish it.
If this card on the field in destroyed: you can Special Summon this card.

#### Wattapir

Monster/Pendulum/Effect/LIGHT/Thunder/Level 4/ATK 1000/DEF 800/Pendulum Scale: 5

[Pendulum Effect]
Once per turn: you can target 1 "Watt" monster in your Graveyard; Special Summon it in DEF position.

[Monster effect]
Can attack your opponent directly.
When this card inflicts Battle Damage to your opponent by a direct attack: target 1 Monster your opponent controls; take control of it until the end phase of this turn, but it cannot attack.
If this card on the field in destroyed: you can Special Summon 1 "Watt" monster from your Graveyard.

#### Wattdog

Monster/Effect/Tuner/Level 2/LIGHT Thunder/ATK 300 DEF 300

If your "Watt" monster(s) would be destroyed (either by battle or effect) you can discard this card instead.
When a "Watt" monster is summoned: you can Special Summon this card from your Graveyard, also, you cannot Special Summon for the rest of this turn, except Thunder monsters.
Once per turn: You can activate 1 of these effects.
● Increase this card's Level by 1, until the End Phase.
● Reduce this card's Level by 1, until the End Phase.

#### Watttower

Field Spell

You can discard 1 card: Special Summon 1 "Watt" monster from your deck in DEF position.
If a "Watt" monster you control is destroyed by battle or card effect, you can Special Summon a "Watt" monster from your Graveyard with a different name.
While your opponent controls the monster with the highest ATK on the field, this card cannot be targeted by your opponent's effect.
You can only activate each effect of "Watttower" once per turn.

#### Wattcerberus

Monster/Effect/Link/Link 2/ATK 1400

2 Thunder monsters
If this card is link summoned: you can add 2 Thunder monsters to your hand, 1 from Graveyard and 1 from your deck, with a different name from each other.
Once per turn you can target 1 "Watt" monster you control; each time it inflicts Battle Damage this turn Special Summon 1 "Watt" monster from your deck.
If this card leaves the field because of your opponent's card: Special Summon 2 "Watt" monsters from your GY in defense position.


sig | name | desc
--- | --- | --- | ---
void | initial_effect(Card c) | The function that will be called for each card's initialization.
int | bit.band(int a, int b) | Does a bitwise AND operation between 2 integers. (Deprecated, advised to use (int a)&(int b) instead.)
int | bit.lshift(int a, int b) | Shifts all bits of an integer to the left by an amount (Deprecated, advised to use (int a)<<(int b) instead.)
int | bit.bor(int a, int b) | Does a bitwise OR operation between 2 integers. (Deprecated, advised to use (int a)|(int b) instead.)
int | bit.rshift(int a, int b) | Shift all bits of an integer to the right by an amount (Deprecated, advised to use (int a)>>(int b) instead.)
int | bit.bxor(int a, int b) | Does a bitwise XOR operation between 2 integers. (Deprecated, advised to use (int a)~(int b) instead.)
int | bit.bnot(int a) | Swaps the bits of an integer, 0 to 1 and 1 to 0. (Deprecated, advised to use ~(int a) instead.)
int | bit.replace(int a, int b, int c[, int width=1]) | Returns a copy of a with the field with a width changed to value b
int | bit.extract(int a, int b[, int width=1]) | Returns the field of a with a width
table, int | GetID() | Returns two values, a card object and its ID, used before the initial effect.
function | fieldargs(function f, int width) | 
int[,int] | Card.GetCode(Card c) | Returns the current code (ID/name) of the card "c".
int | Card.GetOriginalCode(Card c) | Returns the original printed code (ID/name) of the card "c".
int, int | Card.GetOriginalCodeRule(Card c) | Returns the original code (ID/name) of the card "c" while taking into account name clauses/alias (used for the "original name" wording).
int, int ... | Card.GetFusionCode(Card c) | Returns the code/ID that "c" has as a Fusion Material (see "Fusion Tag").
int, int ... | Card.GetLinkCode(Card c) | Returns the code/ID that "c" has as a Link Material (see "Formud Skipper").
bool | Card.IsSummonCode(Card c, Card sc|nil, int sumtype, int playerid, int ...) | Checks if "c" has a specific code from the "..." list if it is to be used as material for the Summon type "sumtype" of "sc" performed by the player "playerid".
bool | Card.IsFusionCode(Card c, int ...) | Checks if "c" has a specific code from the "..." list as a Fusion Material.
bool | Card.IsLinkCode(Card c, int ...) | Checks if "c" has a specific code from the "..." list as a Link Material.
bool | Card.IsSetCard(Card c, int setname[, Card scard|nil, int sumtype = 0, int playerid = PLAYER_NONE]) | Checks if "c" is part of the archetype "setname" (if it is to be used as material for "scard" with Summon type "sumtype" by player "playerid").
bool | Card.IsOriginalSetCard(Card c, int setname) | Checks if "c" is originally part of the archetype "setname".
bool | Card.IsPreviousSetCard(Card c, int setname) | Checks if "c" was previously part of the archetype "setname".
bool | Card.IsFusionSetCard(Card c, int setname) | Checks if "c" is part of the archetype "setname" if it is to be used as a Fusion Material.
int ... | Card.GetSetCard(Card c[, Card|nil scard, int sumtype=0, int playerid=PLAYER_NONE]) | Returns the archetype(s) that "c" has (if it is to be used as material for "scard" with Summon type "sumtype" by player "playerid").
int ... | Card.GetOriginalSetCard(Card c) | Returns the original archetype(s) that "c" is a part of.
int ... | Card.GetPreviousSetCard(Card c) | Returns the archetype(s) that "c" was part of previously.
int ... | Card.GetFusionSetCard(Card c) | Returns the archetype(s) that "c" is a part of if it is to be used as a Fusion Material.
bool | Card.IsLinkSummonable(Card c[, Group|Card|nil must_use, Group|Card|nil  mg, int min=0, int max=0]) | Checks if "c" can be Link Summoned using "must_use" as part of its materials, choosing among "mg", with "min" and "max" materials to be used for the Link Summon.
bool | Card.IsLinkSetCard(Card c, int setname) | "Checks if ""c"" is part of the archetype ""setname"" as a Link Material.
"
int | Card.GetType(Card c[, Card|nil scard, int sumtype = 0, int playerid = PLAYER_NONE]) | Gets the current type of a Card (Card c) where (Card scard) if provided checks the monster that (Card c) would be used as material, (int sumtype) is for checking the summon type and (int playerid) is the player checking the type.
int | Card.GetOriginalType(Card c) | Returns the original card type (Monster/Spell/Trap) of "c".
int | Card.GetLevel(Card c) | Returns the current Level of "c". (Returns 0 if it has no Level, e.g. Xyz/Link.)
int | Card.GetRank(Card c) | Returns the current Rank of "c". (Returns 0 if it has no Rank.)
int | Card.GetLink(Card c) | Returns the current Link Rating of "c". (Returns 0 if it has no Link Rating.)
int | Card.GetSynchroLevel(Card c, Card sc) | Returns the Level of "c" if it would be used as a Synchro Material for "sc".
int | Card.GetRitualLevel(Card c, Card rc) | Returns the Level of "c" if it would be Tributed for the Ritual Summon of "rc".
int | Card.GetOriginalLevel(Card c) | Returns the original Level of "c". (Returns 0 if it has no Level, e.g. Xyz/Link.)
int | Card.GetOriginalRank(Card c) | Returns the original Rank of "c". (Returns 0 if it has no Rank.)
bool | Card.IsXyzLevel(Card c, Card xyzc, int lv) | Checks if "c" would be Level "lv" if it was to be used as Xyz Material for "xyzc".
int | Card.GetLeftScale(Card c) | Returns the current left Pendulum Scale of "c". (Returns 0 if it has no Pendulum Scale.)
int | Card.GetOriginalLeftScale(Card c) | Returns the original left Pendulum Scale of "c". (Returns 0 if it has no Pendulum Scale.)
int | Card.GetRightScale(Card c) | Returns the current right Pendulum Scale of "c". (Returns 0 if it has no Pendulum Scale.)
int | Card.GetOriginalRightScale(Card c) | Returns the original right Pendulum Scale of "c". (Returns 0 if it has no Pendulum Scale.)
bool | Card.IsLinkMarker(Card c, int markers) | Checks if (Card c) has the Link markers represented by (int markers)
Group | Card.GetLinkedGroup(Card c) | Returns a group with all the cards that "c" points to. (Returns an empty group if it does not point to any cards.)
int | Card.GetLinkedGroupCount(Card c) | Returns the number of cards that "c" points to.
int | Card.GetLinkedZone(Card c[, int cp = c:GetControler()]) | Returns all the zones that "c" points to (on the field of player "cp").
int | Card.GetFreeLinkedZone(Card c) | Returns all the zones that "c" points to that are not occupied by a card.
Group | Card.GetMutualLinkedGroup(Card c) | Returns a group with all the cards that are co-linked with "c". (Returns an empty group if there are none.)
int | Card.GetMutualLinkedGroupCount(Card c) | Returns the number of cards that are co-linked with "c".
int | Card.GetMutualLinkedZone(Card c, int cp = c:GetControler()) | Gets all zones that (Card c) points to as part of a co-Link, that belong to player (int cp)
bool | Card.IsLinked(Card c) | Checks if "c" is linked. (A card is linked if it is pointing to another card, or if another card is pointing to it.)
Group | Card.GetColumnGroup(Card c[, int left|nil, int right|nil]) | Returns a group with all the cards that are in the same column as "c". If "left" or "right" are provided, the returned group will also include the cards from the N columns on the left or right of "c" respectively, where N is the number passed for the "left" or "right" parameter.
int | Card.GetColumnGroupCount(Card c[, int left|nil, int right|nil]) | Returns the number of cards that are in the same column as "c". If "left" or "right" are provided, the returned number will also include the cards from the N columns on the left or right of "c" respectively, where N is the number passed for the "left" or "right" parameter.
int | Card.GetColumnZone(Card c, int loc[, int cp = c:GetControler()|nil, int left|nil, int right|nil]) | Returns all the zones in the same column as "c" that are part of the location "loc". If "cp" is provided, the returned zones will only include the ones that belong to player "cp". If "left" or "right" are provided, the returned zones will also include the ones from the N columns on the left or right of "c" respectively, where N is the number passed for the "left" or "right" parameter.
bool | Card.IsAllColumn(Card c) | Checks if all the zones of the column that "c" is on are occupied.
int | Card.GetAttribute(Card c[, Card  scard|nil, int sumtype = 0, int playerid = PLAYER_NONE]) | Returns the current Attribute of "c" (if it is to be used as material for "scard" with Summon type "sumtype" by player "playerid").
int | Card.GetOriginalAttribute(Card c) | Returns the original Attribute of "c".
int | Card.GetRace(Card c[, Card scard|nil, int sumtype = 0, int playerid = PLAYER_NONE]) | Returns the current Monster Type of "c" (if it is to be used as material for "scard" with Summon type "sumtype" by player "playerid").
int | Card.GetOriginalRace(Card c) | Returns the original Monster Type of "c".
int | Card.GetAttack(Card c) | Returns the current ATK of "c".
int | Card.GetBaseAttack(Card c) | Returns the original ATK of "c".
int | Card.GetTextAttack(Card c) | Returns the original printed ATK of "c".
int | Card.GetDefense(Card c) | Returns the current DEF of "c".
int | Card.GetBaseDefense(Card c) | Returns the original DEF of "c".
int | Card.GetTextDefense(Card c) | Returns the original printed DEF of "c".
int, int | Card.GetPreviousCodeOnField(Card c) | Returns the code/ID that "c" had when it was on the field.
int | Card.GetPreviousTypeOnField(Card c) | Returns the card type that "c" had when it was on the field.
int | Card.GetPreviousLevelOnField(Card c) | Returns the Level that "c" had when it was on the field.
int | Card.GetPreviousRankOnField(Card c) | Returns the Rank that "c" had when it was on the field.
int | Card.GetPreviousAttributeOnField(Card c) | Returns the Attribute that "c" had when it was on the field.
int | Card.GetPreviousRaceOnField(Card c) | Returns the Monster Type that "c" had when it was on the field.
int | Card.GetPreviousAttackOnField(Card c) | Returns the ATK that "c" had when it was on the field.
int | Card.GetPreviousDefenseOnField(Card c) | Returns the DEF that "c" had when it was on the field.
int | Card.GetOwner(Card c) | Returns the owner of "c".
int | Card.GetControler(Card c) | Returns the controller of "c".
int | Card.GetPreviousControler(Card c) | Returns the previous controller of "c".
int | Card.GetReason(Card c) | Returns the reason for an event that happened to "c" (e.g. cost, effect).
Card | Card.GetReasonCard(Card c) | Returns the card which is the reason that an event happened to "c".
int | Duel.GetZoneWithLinkedCount(int count, int tp) | "Returns the zones that belong to player ""tp"" and are pointed to by at least ""count"" Link Monsters.
"
void | aux.EnableNeosReturn(Card c[, int extracat, function extrainfo, function extraop]) | Adds the effect to shuffle the card into the Extra Deck at the End Phase (most commonly used by "Neos" Fusion Monsters). If provided, "extracat", "extrainfo" and "extraop" will add additional effect categories, operation info and operations respectively to the effect. The Condition, Target and Operation functions of this effect, named NeosReturnCondition1/2, NeosReturnTarget and NeosReturnOperation, are detailed in cards_specific_functions.lua. 
bool |  Auxiliary.NeosReturnCondition1(e,tp,eg,ep,ev,re,r,rp) | See cards_specific_functions.lua. 
bool | Auxiliary.NeosReturnCondition2(e,tp,eg,ep,ev,re,r,rp) | See cards_specific_functions.lua. 
void | Auxiliary.NeosReturnTarget(c,extrainfo) | See cards_specific_functions.lua. 
void | Auxiliary.NeosReturnOperation(c,extraop) | See cards_specific_functions.lua. 
bool | aux.NeosReturnSubstituteFilter(Card c) | Auxiliary filter used by NeosReturnOperation. Returns if Card c can be removed as cost and is Neos Fusion
function | aux.seqmovcon(e,tp,eg,ep,ev,re,r,rp) | Condition for effects that make the monster change its current sequence/column.
function | aux.seqmovop(e,tp,eg,ep,ev,re,r,rp) | Operation for effects that make the monster change its current sequence/column.
function | aux.FilterFaceupFunction(function f, ...) | filter to check face-up on select(matching card/target) and if exist(matching card/target) functions params
int | Group.GetToBeLinkedZone(card tc, card c, int tp[, bool clink = false, bool emz = false]) | Returns the zone(s) of a player "tp" such that "c" would point to "tc" if "tc" would be summoned. If "clink" is set to true it will only return the zone(s) so that "c" and "tc" would be co-linked. Set "emz" to true if the summoned monster could be placed in the Extra Monster Zone so that the possibility of Extra Linking is accounted for (see "G Golem Crystal Heart" for an example use).
int | Card.GetToBeLinkedZone(group g, card c, int tp[, bool clink = false, bool emz = false]) | Iterates group g with "Card.GetToBeLinkedZone" operations.
int | Card.GetReasonPlayer(Card c) | Returns the player that is the reason for an event that happened to "c".
Effect | Card.GetReasonEffect(Card c) | Returns the effect which is the reason for an event that happened to "c".
void | Card.SetReason(Card c, int reason[, bool keep=false]) | Sets the reason of "c" as "reason". If "keep" is set to true "c" will maintain the previous reason that it had.
void | Card.SetReasonCard(Card c, Card rc) | Sets "rc" as the card that was the reason of an event that happened to "c".
void | Card.SetReasonPlayer(Card c, int rp) | Sets "rp" as the player that was the reason of an event that happened to "c".
void | Card.SetReasonEffect(Card c, Effect re) | Sets "re" as the effect that was the reason of an event that happened to "c".
int | Card.GetPosition(Card c) | Returns the current position of "c".
int | Card.GetPreviousPosition(Card c) | Returns the previous position of "c".
int | Card.GetBattlePosition(Card c) | Returns the position of "c" at the start of the Damage Step (see "Marshmallon").
int | Card.GetLocation(Card c) | Returns the location of "c".
int | Card.GetPreviousLocation(Card c) | Returns the previous location of "c".
int | Card.GetSequence(Card c) | Gets the sequence/order of the location of (Card c)
int | Card.GetPreviousSequence(Card c) | Gets the sequence/order of the location of (Card c)
int | Card.GetSummonType(Card c) | Gets the type in which (Card c) was Summoned
int | Card.GetSummonLocation(Card c) | Returns the location that "c" was summoned from.
int | Card.GetSummonPlayer(Card c) | Returns the player that summoned "c".
int | Card.GetDestination(Card c) | Returns the location that "c" would be sent to (e.g. when it would be destroyed).
int | Card.GetLeaveFieldDest(Card c) | Returns the location that "c" would be sent to when it leaves the field, while taking into account effects that redirect that location (e.g. "but banish it if it leaves the field").
int | Card.GetTurnID(Card c) | Returns the turn that "c" was sent/placed to its current location.
int | Card.GetFieldID(Card c) | Returns the field ID of "c" when it was placed on the field.
int | Card.GetRealFieldID(Card c) | Returns the unique field ID that "c" has.
int | Card.GetCardID(Card c) | Returns the internal card ID that "c" has. This will be unique per card and won't change during the course of the duel.
bool | Card.IsCode(Card c, int ...) | Checks if "c" has at least 1 code/ID among the "..." list.
bool | Card.IsType(Card c, int type[, Card scard|nil, int sumtype = 0, int playerid = PLAYER_NONE]) | Checks if the card type of "c" is "type" (if it is to be used as material for "scard" with Summon type "sumtype" by player "playerid").
bool | Card.IsLevel(Card c, int lv) | Checks if "c" has a Level equal to "lv".
bool | Card.IsRank(Card c, int rk) | Checks if "c" has a Rank equal to "rk".
bool | Card.IsLink(Card c, int lk) | Checks if "c" has a Link Rating equal to "lk".
bool | Card.IsRace(Card c, int race[, Card scard|nil, int sumtype = 0, int playerid = PLAYER_NONE]) | Checks if the Monster Type of "c" is "race" (if it is to be used as material for "scard" with Summon type "sumtype" by player "playerid").
bool | Card.IsAttribute(Card c, int attribute[, Card scard|nil, int sumtype = 0, int playerid = PLAYER_NONE]) | Checks if the Attribute of "c" is "attribute" (if it is to be used as material for "scard" with Summon type "sumtype" by player "playerid").
bool | Card.IsReason(Card c, int reason) | Checks if the reason for an event that happened to "c" is "reason" (REASON_x).
bool | Card.IsSummonType(Card c, int ...) | Checks if "c" is Summoned by one of the summon types in the "..." list.
bool | Card.IsStatus(Card c, int status) | Checks if "c" has the given status (STATUS_x)
bool | Card.IsNotTuner(Card c) | Checks if "c" is a non-Tuner monster.
void | Card.SetStatus(Card c, int status, bool enable) | Sets the status (STATUS_x) of a Card (Card c) and possibly enables it
bool | Card.IsGeminiState(Card c) | Checks if a Card (Card c) is a Gemini monster with its effect enabled.
void | Card.EnableGeminiState(Card c) | Enables the Gemini effect of a card (Card c).
void | Card.SetTurnCounter(Card c, int counter) | Sets the turn counter of a Card (Card c) to a value (int count)
int | Card.GetTurnCounter(Card c) | Gets the turn counter of a Card (Card c)
void | Card.SetMaterial(Card c, Group g) | Sets the Material of a Card (Card c) to another Group (Group g)
Group | Card.GetMaterial(Card c) | Gets the material which was used as cost for a Card (Card c)
int | Card.GetMaterialCount(Card c) | Gets the number of materials used as cost for a Card (Card c)
Group | Card.GetEquipGroup(Card c) | Gets a Group of Cards equipped to a Card (Card c)
int | Card.GetEquipCount(Card c) | Gets the number of cards equipped to a Card (Card c)
Card | Card.GetEquipTarget(Card c) | Gets the Card that a Card (Card c) is equipped to
Card | Card.GetPreviousEquipTarget(Card c) | Gets the Card that a Card (Card c) was equipped to
bool | Card.CheckEquipTarget(Card c1, Card c2) | Checks if a Card (Card c1) has another Card (Card c2) as equip target
int | Card.GetUnionCount(Card c) | Gets Amount of Union monsters equipped to a Card (Card c)
Group | Card.GetOverlayGroup(Card c) | Gets the cards overlayed to a Card (Card c)
int | Card.GetOverlayCount(Card c) | Gets the number of cards overlayed to a Card (Card c)
Card | Card.GetOverlayTarget(Card c) | Gets the card that (Card c) is an overlay of
bool | Card.CheckRemoveOverlayCard(Card c, int player, int count, int reason) | Checks if the player (int player) can remove a number (int count) of Xyz materials from a Card c for a specific reason (int reason)
bool | Card.RemoveOverlayCard(Card c, int player, int min, int max, int reason) | Makes player (int Player) remove overlay cards from a Card (Card c), with minimum of (int min) and maximum of (int max) with (int reason) as reason
Group | Card.GetAttackedGroup(Card c) | Gets a group of cards attacked by Card c, cleared before drawing and when starting second Battle Phase
int | Card.GetAttackedGroupCount(Card c) | Gets the number of cards attacked by Card c, set to 0 before drawing and when starting second Battle Phase
int | Card.GetAttackedCount(Card c) | Gets the number of successful(not negated) attacks done by Card c, set to 0 before drawing and when starting second Battle Phase
Group | Card.GetBattledGroup(Card c) | Gets a Group of cards that are battled (all the attacking and the attacked cards), cleared at predraw and when starting second Battle Phase
int | Card.GetBattledGroupCount(Card c) | Gets the count of cards that has battled (all the attacking and the attacked cards)
int | Card.GetAttackAnnouncedCount(Card c) | Gets the number of attacks declared by Card c, set to 0 before drawing and when starting second Battle Phase
bool | Card.IsDirectAttacked(Card c) | Checks if a Card (Card c) has successfully attacked directly
void | Card.SetCardTarget(Card c1, Card c2) | Sets the second card (Card c2) as a target of the first card (Card c1)
Group | Card.GetCardTarget(Card c) | Gets the group of cards that a card (Card c) is assigned targets to
Card | Card.GetFirstCardTarget(Card c) | Get the first of a card (Card c)'s target cards. A bit faster than Card.GetCardTarget(Card c):GetFirst()
int | Card.GetCardTargetCount(Card c) | Gets the number of targets that a card (Card c) is assigned to
bool | Card.IsHasCardTarget(Card c1, Card c2) | Checks whether the second card (Card c2) is a target of the first card (Card c1)
void | Card.CancelCardTarget(Card c1, Card c2) | Removes the second card (Card c2) from the list of the first card (Card c1)'s target
Group | Card.GetOwnerTarget(Card c) | Gets a group of cards (including equips) that a card (Card c) is a target of
int | Card.GetOwnerTargetCount(Card c) | Gets the number of cards (including equips) that a card (Card c) is a target of
Effect | Card.GetActivateEffect(Card c) | Gets a card (Card c)'s EFFECT_TYPE_ACTIVATE effect
Effect[,Group,int,int,Effect,int,int] | Card.CheckActivateEffect(Card c, bool neglect_con, bool neglect_cost, bool copy_info) | Checks a card (Card c)'s EFFECT_TYPE_ACTIVATE effect while checking for whether it can be activated. Returns _nil_ if effect condition is not met. Set _neglect_con_ to _true_ to ignore condition checking. Set _neglect_cost_ to _true_ to ignore cost payable checking. Set _copy_info_ to true to return the activate effect's supposed info, for other than EVENT_FREE_CHAIN usually (eg,ep,ev,r,re,rp)
int | Card.RegisterEffect(Card c, Effect e[, bool forced=false, ...]) | Registers an Effect (Effect e) (usually an Effect created with Effect.CreateEffect()) to a Card (Card c), ... is a list of integers which Registers further effects in the utility.
bool | Card.IsHasEffect(Card c, int code) | Checks if a Card (Card c) has an Effect (EFFECT_x)
Effect, ... | Card.GetCardEffect(Card c, [, int effect_type]) | Returns all the effect with that code (int effect_type) applied on a card (Card c). With no effect_type or effect_type=0 it will return all the effects applied on a (Card c). [effect_type refer to "EFFECT_" constants, eg: EFFECT_NECRO_VALLEY]
void | Card.ResetEffect(Card c, int reset_code, int reset_type) | Resets all effects of a Card (Card c) (e.g. "c:ResetEffect(RESET_DISABLE,RESET_EVENT)")
int | Card.GetEffectCount(Card c, int code) | Gets the amount of an Effect (EFFECT_x) registered to a Card (Card c)
Effect | Card.RegisterFlagEffect(Card c, int code, int reset_flag, int property, int reset_count[, int label, int desc]) | Registers a flag effect to a card (Card c) with (int code) that resets with (int reset_flag), as the effect code. (int reset_flag).
int | Card.GetFlagEffect(Card c, int code) | Gets the flag effect with (int code) as the effect code that is registered to a card (Card c), returns 0 if no effect, a positive integer otherwise
void | Card.ResetFlagEffect(Card c, int code) | Resets a flag with (int code) as the effect code from a card (Card c)
bool | Card.SetFlagEffectLabel(Card c, int code, int label) | Assigns an integer (int label) number to the flag effect attached to a card (Card c) with (int code) as the effect code
int|nil | Card.GetFlagEffectLabel(Card c, int code) | Gets the integer label to the flag effect attached to a card (Card c) with (int code) as the effect code, returns nil if there is no integer label.
void | Card.CreateRelation(Card c1, Card c2, int reset_flag) | Creates a relation between the first card (Card c1) and the second card (Card c2), which will be reset when the first card hits the reset flag
void | Card.ReleaseRelation(Card c1, Card c2) | Releases the relation between the first card (Card c1) and the second card (Card c2). Does not release relation from the second card that is resulting from _c2:CreateRelation(c1)_
void | Card.CreateEffectRelation(Card c, Effect e) | Creates a relation between a card (Card c) and an effect (Effect e)
void | Card.ReleaseEffectRelation(Card c,Effect e) | Releases any relation between a card (Card c) and an effect (Effect e)
void | Card.ClearEffectRelation(Card c) | Clears any relation between a card (Card c) and all effects and chains
bool | Card.IsRelateToEffect(Card c, Effect e) | Checks whether a card (Card c) is related to an effect (Effect e)
bool | Card.IsRelateToChain(Card c, int chainc) | Checks whether a card (Card c) is related to the chain numbered (int chainc)
bool | Card.IsRelateToCard(Card c1, Card c2) | Checks whether a card (Card c1) is related to another card (Card c2) (That results from _c1:CreateRelation(c2)_)
bool | Card.IsRelateToBattle(Card c) | Checks whether a card (Card c) is related to battle (either as attacker or as an attack target)
int | Card.CopyEffect(Card c, int code, int reset_flag[, int reset_count]) | Temporarily adds to a card (Card c) the effect of card with the specified card code (int code) that resets according to the ascribed reset flag (int reset_flag)
int | Card.ReplaceEffect(Card c, int code, int reset_flag[, int reset_count]) | Temporarily replace all effects of a card (Card c) with the effect of card with the specified card code (int code) that resets according to the ascribed reset flag (int reset_flag)
void | Card.EnableUnsummonable(Card c) | Makes a card (Card c) unsummonable except with its own procedure
void | Card.EnableReviveLimit(Card c) | Makes a card (Card c) unsummonable except with its own procedure, or after it's Summon procedure is complete
void | Card.CompleteProcedure(Card c) | Makes a card (Card c) be considered that it's Summon procedure is complete
bool | Card.IsDisabled(Card c) | Checks whether a card (Card c) is disabled, equivalent with c:IsStatus(STATUS_DISABLED)
bool | Card.IsDestructable(Card c[, Effect e]) | Checks whether a card (Card c) can be destroyed; if an effect (effect e) is given, checks whether the card can be destroyed by that effect
bool | Card.IsSummonableCard(Card c) | Checks if a card (Card c) is normally summonable, returns false when the card is subject of Card.EnableUnsummonable or Card.EnableReviveLimit
bool | Card.IsSpecialSummonable(Card c) | Checks if a card (Card c) is summonable by it's summon procedure
bool | Card.IsSynchroSummonable(Card c[, Group|Card|nil must_use, Group|Card|nil  mg, int min=0, int max=0]) | Checks if "c" can be Synchro Summoned using "must_use" as part of its materials, choosing among "mg", with "min" and "max" materials to be used for the Synchro Summon. How this works is that the script would check for all EFFECT_SPSUMMON_PROC that has SUMMON_TYPE_SYNCHRO as it's Value, then checks the effects' Condition with the provided arguments. Check out "aux.SynCondition" in "proc_synchro.lua" for how this is handled.
bool | Card.IsXyzSummonable(Card c[, Group|Card|nil must_use, Group|Card|nil  mg, int min=0, int max=0]) | Checks if "c" can be Xyz Summoned using "must_use" as part of its materials, choosing among "mg", with "min" and "max" materials to be used for the Xyz Summon
bool | Card.IsSummonable(Card c, bool ignore_count, Effect e|nil[, int min=0]) | Checks whether a card (Card c) can be Normal Summoned. Setting ignore_count to true makes it ignore the standard once per turn summon limit. If an effect (Effect e) is given, checks whether it can be Normal Summoned by that effect. The last value denotes the minimum tribute amount.
bool | Card.IsMSetable(Card, bool ignore_count, Effect e|nil[, int min=0]) | Checks whether a card (Card c) can be Normal Set as a monster. Setting ignore_count to true makes it ignore the standard once per turn summon limit. If an effect (Effect e) is given, checks whether it can be Normal Summoned by that effect. The last value denotes the minimum tribute amount.
bool | Card.IsSSetable(Card c[, bool ignore_field=false]) | Checks whether a card (Card c) can be Set in S/T zone. Setting ignore_field to true makes it not check for free space in the S/T Zone.
bool | Card.IsCanBeSpecialSummoned(Card c, Effect e, int sumtype, int sumplayer, bool nocheck, bool nolimit[, int sumpos=POS_FACEUP, int target_player=sumplayer]) | Checks whether a card (Card c) can be Special Summoned by (Effect e), by a summon of type (int sumtype), by player (int sumplayer), in position (int sumpos), to (int target_player)'s side of the field. If (bool nocheck) is true, it will check for a summon ignoring conditions. If (bool nolimit) is true, it will check for a summon ignoring the revive limit. 
bool | Card.IsAbleToHand(Card c) | Return if the card c can be returned to the hand (return true or false)
bool | Card.IsAbleToDeck(Card c) | Return if the card c can be returned to the Deck (return true or false)
bool | Card.IsAbleToExtra(Card c) | Return if the card c can be returned to the Extra Deck (return true or false)
bool | Card.IsAbleToGrave(Card c) | Checks if a card (Card c) is able to go to the Graveyard
bool | Card.IsAbleToRemove(Card c[, int player]) | Checks if a card (Card c) is able to be banished
bool | Card.IsAbleToHandAsCost(Card c) | Checks if a card (Card c) is able to go to the Hand as a cost
bool | Card.IsAbleToDeckAsCost(Card c) | Checks if a card (Card c) is able to go to the Deck as a cost
bool | Card.IsAbleToExtraAsCost(Card c) | Checks if a card (Card c) is able to go to the Extra Deck as a cost
bool | Card.IsAbleToDeckOrExtraAsCost(Card c) | Checks if a card (Card c) is able to go to either the Deck or the Extra Deck as a cost
bool | Card.IsAbleToGraveAsCost(Card c) | Checks if a card (Card c) is able to go to the Graveyard as a cost
bool | Card.IsAbleToRemoveAsCost(Card c) | Checks if a card (Card c) is able to be banished as a cost
bool | Card.IsReleasable(Card c) | Checks if a card (Card c) is able to be Tributed
bool | Card.IsReleasableByEffect(Card c) | Checks if a card (Card c) is able to be Tributed by a card effect
bool | Card.IsDiscardable(Card[, int reason=REASON_COST]) | Checks if a card (Card c) can be discarded for (int reason).
bool | Card.IsCanAttack(Card c) | Checks if a card (Card c) can attack
bool | Card.CanChainAttack(Card c[, int ac = 2, bool monsteronly = false]) | Checks if a card (Card c) can make a follow-up attack. Specifying the integer ac checks whether it can attack that number of times. Setting monsteronly to true checks only the possibility of follow-up attack to monster
bool | Card.IsFaceup(Card c) | Checks if a card (Card c) is face-up
bool | Card.IsAttack(Card c, int value) | Returns if a card (Card c) has an ATK equal to int value
bool | Card.IsAttackPos(Card c) | Checks if a card (Card c) is in Attack position
bool | Card.IsFacedown(Card c) | Checks if a card (Card c) is face-down
bool | Card.IsDefense(Card c, int value) | Returns if a card (Card c) has an DEF equal to int value
bool | Card.IsDefensePos(Card c) | Checks if a card (Card c) is in Defense position
bool | Card.IsPosition(Card c, int pos) | Checks if a card (Card c) is in the specified position (int pos)
bool | Card.IsPreviousPosition(Card c, int pos) | Checks if a card (Card c) is previously in the specified position (int pos)
bool | Card.IsControler(Card c, int controler) | Checks if a card (Card c) has player (int p) as it's controller
bool | Card.IsOnField(Card c) | Checks if a card (Card c) is located on the field
bool | Card.IsLocation(Card c, int location) | Checks if a card (Card c) is located on the specified location (int location)
bool | Card.IsPreviousLocation(Card c, int location) | Checks if a card (Card c) is previously located on the specified location (int location)
bool | Card.IsLevelBelow(Card c, int level) | Checks if a card (Card c) has level equal or below the specified number (int level), will return false if the card has no level.
bool | Card.IsLevelAbove(Card c, int level) | Checks if a card (Card c) has level equal or above the specified number (int level), will return false if the card has no level.
bool | Card.IsRankBelow(Card c, int rank) | Checks if a card (Card c) has rank equal or below the specified number (int rank), will return false if the card has no rank
bool | Card.IsRankAbove(Card c, int rank) | Checks if a card (Card c) has rank equal or above the specified number (int rank), will return false if the card has no rank
bool | Card.IsLinkBelow (Card c, int link_rating) | Checks if (Card c) has a Link Rating (link_rating) equal or lower than the given number
bool | Card.IsLinkAbove (Card c, int link_rating) | Checks if (Card c) has a Link Rating (link_rating) equal or greater than the given number
bool | Card.IsAttackBelow(Card c, int atk) | Checks if a card (Card c) has ATK equal or below the specified number (int attack), will return false if the card has ? ATK and is not face-up on the field.
bool | Card.IsAttackAbove(Card c, int atk) | Checks if a card (Card c) has ATK equal or above the specified number (int attack), will return false if the card has ? ATK and is not face-up on the field.
bool | Card.IsDefenseBelow(Card c, int def) | Checks if a card (Card c) has DEF equal or below the specified number (int defense), will return false if the card has ? DEF and is not face-up on the field.
bool | Card.IsDefenseAbove(Card c, int def) | Checks if a card (Card c) has DEF equal or above the specified number (int defense), will return false if the card has ? DEF and is not face-up on the field.
bool | Card.IsPublic(Card c) | Checks if a card's (Card c) information is known to both players. In practice, about the same as c:IsPosition(POS_FACEUP)
bool | Card.IsForbidden(Card c) | Checks if a card (Card c) is forbidden to be used (equal to calling c:IsStatus(STATUS_FORBIDDEN))
bool | Card.IsAbleToChangeControler(Card c) | Checks if a card (Card c) is capable of having it's control changed. Checks only whether the card is affected by EFFECT_CANNOT_CHANGE_CONTROL.
bool | Card.IsControlerCanBeChanged(Card c[, bool ign = false, int zone = 0xff]) | Checks if a card (Card c) can change control. Checks whether the card is in Monster Zone and whether the opposing player has enough space, in addition of checking for EFFECT_CANNOT_CHANGE_CONTROL. if a zone is provided, it uses only these zones as references. (also ign is supposed to be ignore monster zone checking)
bool | Card.AddCounter(Card c, int countertype, int count[, int singly=false]) | Adds a number (int count) of the specified counter (int countertype) to a card (Card c). If singly is set to a number, then it will be added by that number each time. When the number of added counter would exceed the limit for that card, it is not added.
void | Card.RemoveCounter(Card c, int player, int countertype, int count, int reason) | Remove a number (int count) of the specified counter (int countertype) from a card (Card c), with reason described by (int reason)
int | Card.GetCounter(Card c, int countertype) | Gets the number of counter (int countertype) on a card (Card c)
bool | Card.IsCanBeMaterial(Card c, int summontype) | Checks if a effect_spsummon_condition is beign applied and is false. It is the generic IscanbeXmaterial
void | Card.EnableCounterPermit(Card c, int countertype[, int location]) | Makes the card (Card c) able to hold a type of counter (int countertype). If a location is provided (int location), the card will be able to hold counter only when in the specified location.
bool | Card.IsFusionSummonableCard | 
void | Card.SetCounterLimit(Card c, int countertype, int count) | Sets the limit (int count) of how many counter of a type (int countertype) can be held by a card (Card c)
bool | Card.IsCanChangePosition(Card c) | Checks if the given (Card c) can change its battle position
bool | Card.IsCanTurnSet(Card c) | Checks if a card (Card c) can be made to face-down position (Set)
bool | Card.IsCanAddCounter(Card c, int countertype, int count[, int singly=false, int loc = 0]) | Checks if a number (int count) of the specified counter (int countertype) can be added to a card (Card c). When the number of added counter would exceed the limit for that card, if singly is set to an integer, then it may return true if the amount of singly doesn't exceed the limit, otherwise, it will return false, if location is specified, it return if it could receive counter when placed on that location.
bool | Card.IsCanRemoveCounter(Card c, int player, int countertype, int count, int reason) | Checks if a number (int count) of the specified counter (int countertype) can be removed from a card (Card c), with reason described by (int reason)
bool | Card.IsCanBeFusionMaterial(Card c[, Card fc, bool ignore_mon=false]) | Checks if a card (Card c) can be a Fusion material. If (Card fc) is provided, checks if it can be a Fusion Material for that card. If ignore_mon is true, it does not check whether the card is a monster.
bool | Card.IsCanBeSynchroMaterial(Card c[, Card sc, Card tuner]) | Checks if a card (Card c) can be used as a Synchro Material. If (Card sc) is provided, checks if it can be a Synchro Material for that card. If (Card tuner) is also provided, also checks if it can be a Synchro Material if the tuner if that card.
bool | Card.IsCanBeRitualMaterial(Card c[, Card sc]) | Checks if a card (Card c) can be used as Tribute for Ritual Summon. If (Card sc) is provided, checks if it can be used as Tribute for that card's Ritual Summon.
bool | Card.IsCanBeXyzMaterial(Card c, Card sc|nil) | Checks if a card (Card c) can be used as an Xyz Material. If (Card sc) is provided, checks if it can be used for that card's Xyz Summon.
bool | Card.IsCanBeLinkMaterial(Card c, [Card linkc, int player]) | Checks if (Card c) can be used as material for a (Card linkc). "player" is only an additional parameter, is used to send it to the functions as an additional parameter, such as target (function in SetTarget) or operation (function in SetOperation).
bool | Card.CheckFusionMaterial(Card c[, Group g, Card gc|nil, int chkf=PLAYER_NONE]) | "Check if g contains a set of fusion material that c needs [must contain gc]
## Check the Condition function for the effect of EFFECT_FUSION_MATERIAL according to the type of c"
bool | Card.CheckFusionSubstitute(Card c, Card fc) | Checks if a card (Card c) can be treated as a substitute for one of a Fusion Monster's (Card fc) Fusion Material.
bool | Card.IsImmuneToEffect(Card c, Effect e) | Checks if a card (Card c) is not affected by an effect (Effect e)
bool | Card.IsCanBeEffectTarget(Card c, Effect e) | Checks if a card (Card c) is targetable by an effect (Effect e)
bool | Card.IsCanBeBattleTarget(Card c1, Card c2) | Checks if a card (Card c1) is a valid battle target for another card (Card c2)
void | Card.AddMonsterAttribute(Card c, int extra_type, [int attribute, int race, int level, int atk, int def]) | Transforms a card (Card c) to a monster. The card type will become TYPE_MONSTER + extra_type. Uses the values if provided, otherwise uses the card's own values in Database. Be aware that the values added using this (except for Card type) will be reset when the card is flipped face-down.
void | Card.AddMonsterAttributeComplete(Card c) | Used in conjunction with Card.AddMonsterAttribute, completes a card's (Card c) transformation to a monster. It is best to call this after the card has arrived in Monster Zone (i.e. after Duel.SpecialSummonStep). Does nothing with cards without EFFECT_PRE_MONSTER (added automatically by Card.AddMonsterAttribute).
void | Card.CancelToGrave(Card c[, bool cancel=true]) | if cancel is true, cancels the to-grave rule and movement of a card (Card c). If false, enforce the rule that it must go from the field to Graveyard instead.
int,int | Card.GetTributeRequirement(Card c) | Give a min and a max tribute requirement of a card
Card | Card.GetBattleTarget(Card c) | Gets a card's (Card c) current battle target
Group,bool | Card.GetAttackableTarget(Card c) | Gets a card's (Card c) valid attack targets
void | Card.SetHint(Card c, int type, int value) | Sets a card (Card c) hint displaying, type is CHINT_* and value is the appropriate value depending on the type
void | Card.ReverseInDeck(Card c) | Reverse a card (Card c) in Deck (make it face-up)
void | Card.SetUniqueOnField(Card c, int s, int o, int unique_code[, int unique_location=LOCATION_ONFIELD]) | Sets a card's (Card c) "Can only control 1" clause, int s denotes checking of the would-be owner's field, int o denotes checking the opposing field. unique_location denotes the location the card is unique (setting location outside the field has no meaning)
bool | Card.CheckUniqueOnField(Card c,int check_player) | Checks if a card's (Card c) going to a player's (int player) field would violate the "Can only control 1" clause
void | Card.ResetNegateEffect(Card c[, int code1,...]) | Reset a card c affected by the effect of cards whose card number is code1, code2 ...
void | Card.AssumeProperty(Card c,int assume_type, int assume_value) | Assume a property for a card (Card c), the card will be considered as having an assumed specific property (int assume_type) as the inputted value (int assume_value) (only as long as the function is still processing)
void | Card.SetSPSummonOnce(Card c, int spsummon_code) | Make a card (Card c) can only be Special Summoned when the turn has not Special Summoned another card with the same code (int code) as its Card.SetSpecialSummonOnce. Basically, makes the "You can only Special Summon "Some Monster" once per turn" condition
void|int | Card.Code(Card c[, int code]) | Changes (Card c)'s original card name if (int code) is inputted, else returns the current original card name.
void|int | Card.Alias(Card c[, int code]) | Changes (Card c)'s alias if (int code) is inputted, else returns the current card's alias.
void|int | Card.Setcode(Card c[, int setcode]) | Changes (Card c)'s original archetype(s)/setcode(s) if (int setcode) is inputted, else returns the current card's original archetype(s)/setcode(s).
void|int | Card.Type(Card c[, int type]) | Changes (Card c)'s original type(s) if (int type) is inputted, else returns the current card's original type(s).
void|int | Card.Level(Card c[, int level]) | Changes (Card c)'s original level if (int level) is inputted, else returns the current card's original level
void|int | Card.Attribute(Card c[, int att]) | Changes (Card c)'s original attribute(s) if (int att) is inputed, else returns the current card's original attribute(s).
void|int | Card.Race(Card c[, int race]) | Changes (Card c)'s original monster type(s)/race(s) if (int race) is inputed, else returns the current card's original monster type(s)/race(s).
void|int | Card.Attack(Card c[, int val]) | Changes (Card c)'s original ATK if (int val) is inputted, else returns the current card's original ATK.
void|int | Card.Defense(Card c[, int val]) | Changes (Card c)'s original DEF if (int val) is inputted, else returns the current card's original DEF.
void|int | Card.Rscale(Card c[, int scale]) | Changes (Card c)'s original left scale if (int scale) is inputted, else returns the current card's original left scale.
void|int | Card.Lscale(Card c[, int scale]) | Changes (Card c)'s original right scale if (int scale) is inputted, else returns the current card's original right scale.
void|int | Card.LinkMarker(Card c[, int linkmarker]) | Changes (Card c)'s original Link Markers if (int linkmarker) is inputted, else returns the current card's original Link Markers.
void | Card.Recreate(Card c, int code[, int|nil alias, int|nil setcode, int|nil type, int|nil level, int|nil attribute, int|nil race, int|nil atk, int|nil def, int|nil lscale, int|nil rscale, bool|nil replace_effect=false]) | Changes (Card c) into a card with (int code) as its original card number from the database. If any of the parameters are included, that stat is also changed. If (bool replace_effect) is set to true, its effect also changes to the effects of (int code).
bool | Effect.CheckCountLimit() | 
Effect | Effect.CreateEffect(Card c) | Create a new effect object with a card (Card c) as it's owner
void | Effect.UseCountLimit | 
Effect | Effect.GlobalEffect() | Create a new effect object without owner
Effect | Effect.Clone(Effect e) | Clone an effect object (Effect e), duplicating all except register status and assigned labels
void | Effect.Reset(Effect e) | Reset an effect (Effect e), effectively deleting it
int | Effect.GetFieldID(Effect e) | Gets a unique ID representing a certain instance of an effect.
void | Effect.SetDescription(Effect e, int desc) | Sets an effect's (Effect e) description string id with (int desc) taken from cdb and strings.conf (description in cdb is [cardnumber *16+index], aux.Stringid is a shortcut).
void | Effect.SetCategory(Effect e, int cate) | Sets an effect's (Effect e) category. Refer to constant.lua for valid categories.
void | Effect.SetType(Effect e, int type) | Sets an effect's (Effect e) type. Refer to constant.lua and card scripts that has been already there for valid types (or ask someone).
void | Effect.SetCode(Effect e, int code) | Sets an effect's (Effect e) code. Refer to constant.lua and card scripts that has been already there for valid codes (or ask someone).
void | Effect.SetProperty(Effect e, int prop1[, int prop2]) | Sets an effect's (Effect e) property. Refer to constant.lua and card scripts that has been already there for valid properties (or ask someone).
void | Effect.SetRange(Effect e, int range) | Sets an effect's (Effect e) effective range (int range) i.e. LOCATION_MZONE. The location is the effect handler's location.
void | Effect.SetAbsoluteRange(Effect e, int playerid, int s_range, int o_range) | Sets an effect's (Effect e) target range in perspective of the supplied player (int playerid), s_range denotes the supplied player's range and o_range denotes the opponent's.
void | Effect.SetCountLimit(Effect e, int count[, int code=0]) | Sets an effect's (Effect e) use limit per turn to (int count), if code is supplied, then it would count toward all effects with the same count limit code (i.e. Hard OPT)
void | Effect.SetReset(Effect e, int reset_flag[, int reset_count=1]) | Sets the timing that the effect (Effect e) would be erased (with reset_flag)
void | Effect.SetLabel(Effect e, int label) | Sets an effect's (Effect e) internal label to (int label)
void | Effect.SetLabelObject(Effect e, Card|Group|Effect labelobject) | Sets an effect's (Effect e) internal label object to labelobject
void | Effect.SetHintTiming(Effect e, int s_time[, int o_time=s_time]) | Sets an activated (Effect e)'s client usage hint timing
void | Effect.SetCondition(Effect e, function con_func) | Sets (Effect e)'s condition function
void | Effect.SetCost(Effect e, function cost_func) | Sets (Effect e)'s cost function
void | Effect.SetTarget(Effect e, function targ_func) | Sets (Effect e)'s target function
void | Effect.SetTargetRange(Effect e, int s_range, int o_range) | Sets (Effect e)'s target range, s_range denotes the effect's handler player's range and o_range denotes the opponent's.
void | Effect.SetValue(Effect e, function|int|bool val) | Sets (Effect e)'s value, or value function
void | Effect.SetOperation(Effect e, function op_func) | Sets (Effect e)'s operation function
void | Effect.SetOwnerPlayer(Effect e[, int player]) | Sets (Effect e)'s owner player (the [int player] is actually not optional)
int | Effect.GetDescription(Effect e) | Gets (Effect e)'s assigned description string id
int | Effect.GetCode(Effect e) | Gets (Effect e)'s code
int, int, int | Effect.GetCountLimit(Effect e) | Get (Effect e)'s remaining, and maximum count limit, and any code parameter (e.g. detect "The effect of "card name" can only be used once per turn.)
int, int | Effect.GetReset(Effect e) | Gets (Effect e)'s reset flag and reset count.
int | Effect.GetType(Effect e) | Gets an effect's (Effect e) type
int,int | Effect.GetProperty(Effect e) | Gets an effect's (Effect e) property
int | Effect.GetLabel(Effect e) | Gets an effect's (Effect e) internal label
Card|Group|Effect | Effect.GetLabelObject(Effect e) | Gets an effect's (Effect e) internal label object
int | Effect.GetCategory(Effect e) | Gets an effect's (Effect e) category
Card | Effect.GetOwner(Effect e) | Gets an effect's (Effect e) card owner, if the owner is not a card (GlobalEffect) then returns nil
Card | Effect.GetHandler(Effect e) | Gets an effect's (Effect e) card handler, if the effect is not attached to a card (i.e. registered to player) it returns nil
function | Effect.GetCondition(Effect e) | Gets an effect's (Effect e) condition function, returns nil if no function was set
function | Effect.GetTarget(Effect e) | Gets an effect's (Effect e) target function, returns nil if no function was set
function | Effect.GetCost(Effect e) | Gets an effect's (Effect e) cost function, returns nil if no function was set
function|int | Effect.GetValue(Effect e) | Gets an effect's (Effect e) value or value function, returns nil if no function was set
function | Effect.GetOperation(Effect e) | Gets an effect's (Effect e) operation function, returns nil if no function was set
int | Effect.GetActiveType(Effect e) | Gets an effect's (Effect e) card type of activation effect. Activation type is often the effect handler's card type, or the owner's if not attached to a card. Exception for Pendulum scale activation (would return TYPE_SPELL+TYPE_PENDULUM).
bool | Effect.IsActiveType(Effect e, int type) | Compares (with OR) an effect's (Effect e) card type of activation effect with supplied type (int type). Activation type is often the handler's card type, or the owner's if not attached to a card. Exception for Pendulum scale activation (would return TYPE_SPELL+TYPE_PENDULUM).
int | Effect.GetOwnerPlayer(Effect e) | Gets an effect's (Effect e) owner player
int | Effect.GetHandlerPlayer(Effect e) | Gets an effect's (Effect e) handler player
bool | Effect.IsHasProperty(Effect e, int prop1[, int prop2]) | Returns true if the effect (Effect e) has any property listed in (int prop1) or (int prop2), otherwise returns false
bool | Effect.IsHasCategory(Effect e, int cate) | Returns true if the effect (Effect e) has any category listed in (int cate), otherwise returns false
bool | Effect.IsHasType(Effect e, int type) | Returns true if the effect (Effect e) has any type listed in (int type), otherwise returns false
bool | Effect.IsActivatable(Effect e, int player, bool ignore_location, bool ignore_target) | Checks if an effect (Effect e) can be activated by a player (int player)
bool | Effect.IsActivated(Effect e) | Checks if an effect (Effect e) is an activated effect (not continuous and is a triggering effect)
int | Effect.GetActivateLocation(Effect e) | Get the effect's (Effect e) applicable range (gets it's s_range)
int | Effect.GetActivateSequence(Effect e) | Get (Effect e)'s sequence when it was activated.
Group | Group.CreateGroup() | Create a new Group object
void | Group.KeepAlive(Group g) | Make a group (Group g) not be destroyed upon exiting the function
void | Group.DeleteGroup(Group g) | Destroy a group (Group g)
Group | Group.Clone(Group g) | Create a copy of a group (Group g) with the same members
Group | Group.FromCards(Card c[, ...]) | Create a new Group object and populate it with cards (Card c, ...)
void | Group.Clear(Group g) | Empty a group (Group g)
void | Group.AddCard(Group g, Card c) | Add a card (Card c) to a group (Group g)
void | Group.RemoveCard(Group g, Card c) | Remove a card (Card c) from a group (Group g)
Card | Group.GetFirst(Group g) | Gets the first member of Group g (also resets the internal enumerator)
Card | Group.GetNext(Group g) | Gets then next member of Group g (moves the internal enumerator by a step)
Group | Group.TakeatPos(Group g, int pos) | return a new group made of cards that are only in the position specified (int pos)
int | Group.GetCount(Group g) | Gets the amount of objects in a group (Group g)
void | Group.ForEach(Group g, function f, ...) | Executes a function for each card in a group (Group g), function f should accept one parameter (e.g. f(c, ...), with c as each member of the group and ... can be any number of parameters)
Group | Group.Filter(Group g, function f, Group|Card ex|nil, ...) | Create a new group with members from another group (Group g) filtered according to a function (function f). Excludes a card/group (Group/Card ex) if not nil. Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the card will be included if f(c,...) returns true.
int | Group.FilterCount(Group g, function f, Group|Card ex|nil, ...) | Counts the amount of members of a group (Group g) which meets the function (function f). Excludes a card (Card ex) if not nil. Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the card will be included if f(c,...) returns true.
Group | Group.FilterSelect(Group g, int player, function f, int min, int max[, bool cancelable=false], Group|Card ex|nil, ...) | Make a player (int player) select members of a group (Group g) which meets the function (function f), with a minimum and a maximum, then outputs the result as a new Group. Excludes a card (Card ex) if not nil. Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the card will be included if f(c,...) returns true. If cancelable is true and the selection is canceled nil will be returned.
Group | Group.Select(Group g, int player, int min, int max[, bool cancelable=false] Group|Card ex|nil) | Make a player (int player) select members of a group (Group g), with a minimum and a maximum, then outputs the result as a new Group. Excludes a card (Card ex) if not nil. If cancelable is true and the selection is canceled nil will be returned.
Card | Group.SelectUnselect(Group g1, Group g2, int player[, bool finishable, bool cancelable, int min, int max]) | Selects cards in a loop that allows unselection/cancellation. (Group g1) is the group of not selected cards, (Group g2) is the group of already selected cards, (int player) is the player who selects the card, (bool finishable) indicates that the current selection has met the requirements and thus can be finished with the right click, (bool cancelable) indicates that the selection can be canceled with the right click (in the procedures this is set when the selected group is empty and no chain is going on), (int max) and (int min) does nothing to the function, they are only the max and min values shown in the hint. Every card in both the groups can be selected. The function returns a single card
Group | Group.RandomSelect(Group g, int player, int count) | Make a player (int player) randomly select (int amount) members of a group (Group g).
bool | Group.IsExists(Group g, function f, int count, Group|Card ex|nil, ...) | Checks if at least a number (int count) of members of a group (Group g) meet the function (function f). Excludes a card (Card ex) if not nil. Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the card will be included if f(c,...) returns true.
bool | Group.CheckWithSumEqual(Group g, function f, int sum, int min, int max, ...) | Checks if there is a combination of cards, with a minimum and maximum, that has the sum of f(c,...) result equal to (int sum) in a group (Group g). Function f accepts at least one parameter (f(c,...). with c as each member of the group), and the return value should be integer.
Group | Group.SelectWithSumEqual(Group g, int player, function f, int sum, int min, int max, ...) | Makes a player (int player) select members of a group (Group g) which results in a combination of cards, with a minimum and maximum, that has the sum of f(c,...) result equal to (int sum). Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the return value should be integer.
bool | Group.CheckWithSumGreater(Group g, function f, int sum, ...) | Checks if there is a combination of cards, with a minimum and maximum, that has the sum of f(c,...) result greater than or equal to (int sum) in a group (Group g). Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the return value should be integer.
Group | Group.SelectWithSumGreater(Group g, int player, function f, int sum, ...) | Makes a player (int player) select members of a group (Group g) which results in a combination of cards, with a minimum and maximum, that has the sum of f(c,...) result greater than or equal to (int sum). Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the return value should be integer.
Group,int/nil | Group.GetMinGroup(Group g, function f, ...) | Create a new group with members from another group (Group g) which has the minimum result from f(c,...). Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the return value should be integer, if the group g have no element, that function will return nil.
Group,int/nil | Group.GetMaxGroup(Group g, function f, ...) | Create a new group with members from another group (Group g) which has the maximum result from f(c,...). Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the return value should be integer, if the group g have no element, that function will return nil.
int | Group.GetSum(Group g, function f, ...) | Gets the sum of f(c,...) result from all members of a group (Group g). Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the return value should be integer.
int | Group.GetClassCount(Group g, function f, ...) | Gets the count of different f(c,...) results from all members of a group (Group g). Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the return value should be integer.
void | Group.Remove(Group g, function f, Group|Card ex|nil, ...) | Removes members of a group (Group g) that meets the function (function f). Excludes a card (Card ex) from removal if not nil. Function f accepts at least one parameter (f(c,...), with c as each member of the group), and the card will be included if f(c,...) returns true.
void | Group.Merge(Group g1, Group g2) | Inserts members of the second group (Group g2) to the first group (Group g1). (This will alter g1)
void | Group.Sub(Group g1, Group g2) | Removes members of the second group (Group g2) from the first group (Group g1). (This will alter g1)
bool | Group.Equal(Group g1, Group g2) | Checks if the first group (Group g1) has the same members with the second group (Group g2)
bool | Group.IsContains(Group g, Card c) | Checks if a group (Group g) contains a specified card (Card c)
Card | Group.SearchCard(Group g, function f, ...) | Gets the first card found in a group (Group g) which f(c,...) returns true. Function f accepts at least one parameter (f(c,...), with c as each member of the group), and must return a boolean.
Group, Group | Group.Split(Group g, function f, ...) | split group g into 2 groups, first is card that match the function f and the second one are the other cards.
void | Duel.EnableGlobalFlag(int global_flag) | Enables the specified global flags (int global_flag) for the rest of the Duel (GLOBALFLAG_x).
int | Duel.GetLP(int player) | Gets a specified player's (int player) current Life Point value
void | Duel.SetLP(int player, int lp) | Sets a specified player's (int player) current Life Point value to a value (int lp)
int | Duel.GetTurnPlayer() | Returns the turn player (0 for tp, 1 for the opponent)
int | Duel.GetTurnCount() | Gets the turn count
int | Duel.GetDrawCount(int player) | Gets the draw count for normal draw for a player (int player)
void | Duel.RegisterEffect(Effect e, int player) | Register an effect (Effect e) to a player (int player)
Effect | Duel.RegisterFlagEffect(int player, int code, int reset_flag, int property, int reset_count) | Registers a flag effect to a player (int player) with (int code) as the effect code
int | Duel.GetFlagEffect(int player, int code) | Gets the flag effect with (int code) as the effect code that is registered to a player (int player), returns 0 if no effect, a positive integer otherwise
void | Duel.ResetFlagEffect(int player, int code) | Resets a flag with (int code) as the effect code from a player (int player)
int | Duel.Destroy(Card|Group targets, int reason[ ,int dest = LOCATION_GRAVE]) | Destroys a card or group (Card|Group targets) with (int reason) as reason, if (int dest) is supplied, the destination of the destroyed cards will be it's value. Returns the number of cards successfully destroyed.
int | Duel.Remove(Card|Group targets, int pos, int reason[,int player]) | Banishes a card or group (Card|Group targets) in position as supplied by (int pos) (nil means default banish position), with (int reason) as reason, if (int player) is supplied, the destination would be that player's zone. Returns the number of cards successfully banished.
void | Duel.RemoveCards | 
int | Duel.SendtoGrave(Card|Group targets, int reason[, int player]) | Sends a card or group (Card|Group targets) to the Graveyard with (int reason) as reason, if (int player) is supplied, the destination would be that player's Graveyard. Returns the number of cards successfully sent.
int | Duel.SendtoHand(Card|Group targets, int player|nil, int reason) | Sends a card or group (Card|Group targets) to the Hand with (int reason) as reason, if (int player) is supplied, the destination would be that player's Hand. Returns the number of cards successfully sent.
int | Duel.SendtoDeck(Card|Group targets, int player|nil, int seq, int reason) | Sends a card or group (Card|Group targets) to the Deck with (int reason) as reason, if (int player) is supplied, the destination would be that player's Deck. Available seq values (SEQ_DECKTOP, SEQ_DECKBOTTOM and SEQ_DECKSHUFFLE). If SEQ_DECKSHUFFLE or other values are used for the sequence, the card is put on the top, and the Deck will be shuffled after the function resolution, except if Duel.DisableShuffleCheck() is set to true beforehand. Returns the number of cards successfully sent to the Deck.
int | Duel.SendtoExtraP(Card|Group targets, int player|nil, int reason) | Sends a card or group (Card|Group targets) to the Extra Deck face-up with (int reason) as reason, if (int player) is supplied, the destination would be that player's Extra Deck (for Pendulum monsters only). Returns the number of cards successfully sent.
int | Duel.Sendto(Card|Group, int location, int reason,[int pos=POS_FACEUP, int player=PLAYER_NONE, int sequence=0]) | Sends a card or group (Card|Group targets) to the location (int location) with (int reason) as reason in (ins pos) position (only applies in Extra Deck and Banish). If (int player) is supplied, the destination would be that player's location. A seq value of 0 means it's put on the top, 1 means it's put on the bottom, other values means it's put on the top, and the if it is Deck, it will be shuffled after the function resolution except if Duel.DisableShuffleCheck() is set to true beforehand. Returns the number of cards successfully sent.
Group | Duel.GetOperatedGroup() | Gets the last group of operated cards (from last call of some functions, ex. calling this after Duel.Draw would return a group of the drawn cards)
void | Duel.Summon(int player, Card c, bool ignore_count, Effect e|nil[, min=0]) | Makes a player (int player) Normal Summons a card (Card c) using the Normal Summon procedure that the card has. If (ignore_count) is set to true, the Summon would not count towards the standard limit of Normal Summon/Set. If an effect (Effect e) is provided, the Normal Summon is counted as a Summon by that effect. If (min) is greater than 0, the Summon proc must need that amount or more tributes.
void | Duel.SpecialSummonRule(int player, Card c) | A player (int player) Special Summons a card (Card c) using Special Summon proc that the card has
void | Duel.SynchroSummon(int player, Card c[, Group|Card|nil must_use, Group|Card|nil mg, int minc=0, int maxc=0]) | A player (int player) Synchro Summons a card (Card c) using "must_use" as part of its materials, choosing among "mg", with "min" and "max" materials to be used for the Summon
void | Duel.XyzSummon(int player, Card c[, Group|Card|nil must_use, Group|Card|nil mg, int minc=0, int maxc=0]) | A player (int player) Xyz Summons a card (Card c) using "must_use" as part of its materials, choosing among "mg", with "min" and "max" materials to be used for the Summon
void | Duel.LinkSummon(int player, Card c[, Group|Card|nil must_use, Group|Card|nil mg, int minc=0, int maxc=0]) | A player (int player) Link Summons a card (Card c) using "must_use" as part of its materials, choosing among "mg", with "min" and "max" materials to be used for the Summon.
void | Duel.LoadScript (string file_name) | Loads into the current enviroment (duel/puzzle) (file_name)'s script.
void | Duel.LoadCardScript(string|int code) | Loads into the current enviroment (duel/puzzle) the script from card which id is int code. If a string is used, it must be "c'code'.lua"
void | Duel.MSet(int player, Card c, bool ignore_count, Effect e|nil[, min=0]) | A player Sets a card (Card c) using Normal Summon proc that the card has. if ignore_count is true, the Set would not count towards the standard limit of Normal Summon/Set. If an effect (Effect e) is provided, the Normal Set is counted as a Set by that effect. if min>0 then the Set proc must need that amount or more tributes.
void|int | Duel.SSet(int player, Card|Group targets[, int target_player = player, bool show]) | A player Sets a card/cards (Card|Group target) to the Spell/Trap Card Zone. If target_player is provided, then the player will Set the card to that target player's field, if bool show is set to false, the card set is not revealed - for confirmation - to the opponent.
Card | Duel.CreateToken(int player, int code[, int setcode, int attack, int defense, int level, int race, int attribute]) | Create a token for a player (int player) with card code (int code)
int | Duel.SpecialSummon(Card|Group targets, int sumtype, int sumplayer, int target_player, bool nocheck, bool nolimit, int pos) | A player (int sumplayer) Special Summons a card/group of cards (Card|Group targets) with summon type described with SUMMON_TYPE_x (int sumtype) to a player's (int target_player) field. Returns the number of cards successfully summoned.
bool | Duel.SpecialSummonStep(Card c, int sumtype, int sumplayer, int target_player, bool nocheck, bool nolimit, int pos) | A player (int sumplayer) Special Summons a card (Card c) with summon type described with SUMMON_TYPE_x (int sumtype) to a player's (int target_player) field.
void|int | Duel.SpecialSummonComplete() | Completes Special Summons conducted with Duel.SpecialSummonStep
bool | Duel.IsCanAddCounter(int player, int countertype, int count, Card c) | Checks whether a player (int player) can add a number (int count) of counters (int countertype) to a card (Card c)
bool | Duel.IsDuelType(int flag) | Check if the current duel is of the current flag (ex: using DUEL_OBSOLETE_RULING will check if it obsolete rulings)
bool | Duel.RemoveCounter(int player, int s, int o, int countertype, int count, int reason) | Makes a player (int player) remove counter(s) (int countertype) (int count) from the field with a reason (int reason). The variables int s and int o are the player's and the opponent's field, respectively, 0 to exclude and 1 (or higher) to include.
bool | Duel.IsCanRemoveCounter(int player, int s, int o, int countertype, int count, int reason) | Checks if a player (int player) can remove counter(s) (int countertype) (int count) from the field with a reason (int reason). The variables int s and int o are the player's and the opponent's field, respectively, 0 to exclude and 1 (or higher) to include.
int | Duel.GetCounter(int player, int s, int o, int countertype) | Gets the number of counter (int countertype) on the field, from a player's (int player) perspective. The variables int s and int o are the player's and the opponent's field, respectively, 0 to exclude and 1 (or higher) to include.
int | Duel.ChangePosition(Card|Group targets, int au[, int ad=au, int du=au, int dd=au, bool noflip=false]) | Changes the battle position of (Card|Group targets). (int au), (int ad), int (du) and (int dd) are the positions cards in face-up attack, face-down attack, face-up defense, and face-down defense positions will be changed to, respectively. If (bool noflip) is true, FLIP effects will not be activated by this change. Returns the number of cards successfully affected.
int | Duel.Release(Card|Group targets, int reason) | Tribute a card(s) (Card|Group targets) with listed reason (int reason). Returns the number of cards successfully Tributed.
bool | Duel.MoveToField(Card c, int move_player, int target_player, int dest, int pos, bool enabled, int zone = 0xff) | A player (int move_player) moves a card (Card c) to the target player's field. The destination must be either LOCATION_MZONE or LOCATION_SZONE (maybe LOCATION_ONFIELD too). It will be sent with the given position (int pos). Its effects will either be enabled or disabled according to the last parameter (bool enabled), if zone is specified, it can only place the card in these zones.
bool | Duel.ReturnToField(Card c[, int pos]) | Return a card (Card c) to the field (only valid for cards that leaves the field with REASON_TEMPORARY, pos denotes the return position (if not specified, uses the card's previous position on field)
void | Duel.MoveSequence(Card c, int seq) | Move a card (Card c) to another sequence within its location (int seq)
void | Duel.SetChainLimit(function f) | Sets a function for limiting effects that could chain from this point in the chain, removed when an effect is chained to the current chain. Function f accepts at most 3 parameters [f(e,tp,p)] in which e is the effect that would be chained, tp is the same tp from the effect function where this function is called , and p is the player who would activate the would-be chaining effect.
void | Duel.SetChainLimitTillChainEnd(function f) | Sets a function for limiting effects that could chain from this point for the chain until the end of the chain. Function f accepts at most 3 parameters [f(e,tp,p)] in which e is the effect that would be chained, tp is the same tp from the effect function where this function is called , and p is the player who would activate the would-be chaining effect.
Effect | Duel.GetChainMaterial(int player) | Gets the EFFECT_CHAIN_MATERIAL field effect that is applied to a player (int player). Would only get the first effect it founds.
void | Duel.ConfirmDecktop(int player, int count) | Made a number (int count) of cards from the top of a player's (int player) Deck known to both players
void | Duel.ConfirmCards(int player, Card|Group targets) | Confirm the informations of a card/group of cards (Card|Group targets) to the specified player (int player)
void | Duel.ConfirmExtratop(int tp) | 
void | Duel.SortDecktop(int sort_player, int target_player, int count) | Player (int sort_player) sorts an amount of cards (int count) of a player's (int target_player) decktop
void | Duel.CheckTribute(card c, int min, int max, group mg, int tp, zone) | 
bool[,Group,int,int,Effect,int,int] | Duel.CheckEvent(int event[, bool get_info]) | Returns if, at the activation timing, the (int event) passed is available. If (bool get_info) is set to true, all the even info are returned as extra return values
void | Duel.RaiseEvent(Group|Card eg, int code, Effect re, int r, int rp, int ep, int ev) | Raises an Event which can for example trigger other Effects with the entered Code
void | Duel.RaiseSingleEvent(Card ec, int code, Effect re, int r, int rp, int ep, int ev) | Raises an Event which can for example trigger other Effects with the entered Code
bool | Duel.CheckTiming(int timing) | Returns true if the current timing is int timing
int,int | Duel.GetEnvironment() | Gets the environment code for the applied field card (the same as the Field Spell's code, usually). Returns the code, then the controlling player. Prioritizes the first player.
bool | Duel.IsEnvironment(int code[, int player=PLAYER_ALL]) | Checks if the environment contains a code (int code). If specified, checks only for the player's (int player) side.
void | Duel.Win(int player, int win_reason) | Player (int player) wins the Duel for a reason (REASON_x)
int | Duel.Draw(int player, int count, int reason) | Player (int player) draws a specific amount (int count) of Cards for a reason (REASON_x)
int | Duel.Damage(int player, int value, int reason[, bool is_step=false]) | Damages/Decreases player's (int player) Life Points by an amount (int value) for a reason (REASON_x). Setting is_step to true made the damage considered dealt at the call of Duel.RDComplete()
int | Duel.Recover(int player, int value, int reason[, bool is_step=false]) | Increases player's (int player) Life Points by an amount (int value) for a reason (REASON_x). Setting is_step to true made the recovery considered being done at the call of Duel.RDComplete()
void | Duel.RDComplete() | Complete Damage/Recover step (for simultaneous damage/recovery)
bool | Duel.Equip(int player, Card c1, Card c2[, bool up=true, bool is_step=false]) | A Player (int player) equips a Card (Card c1) to another Card (Card c2)
void | Duel.EquipComplete() | Concludes a series of Equips (Always used with 'is_step = true' in Duel.Equip())
void | Duel.ForceAttack(Card c1, Card c2) | Last Turn's specific effect: after the chain resolves, makes card (card c1) attack (card c2). After that, returns to the previous phase.
Card | Duel.GetCardFromCardID(int cardid) | Returns the card whose internal id matches cardid, if no card matches, nil is returned.
bool | Duel.GetControl(Card|Group targets, int player[, int reset_phase=0, int reset_count=0, int zone = 0xff]) | Give control of a card/group (Card|Group targets) to a player (int player). If reset_phase and reset_count is specified, will behave like other effects with those resets (and so, the control will be returned when the effect has expired). Works only for monsters in Monster Zone, if zone is specified, if moves monster to that zones only or destroy if they are full.
Group | Duel.GetExtraTopGroup(int tp) | 
bool | Duel.SwapControl(Card c1, Card c2[, int reset_phase=0, int reset_count=0]) | Swaps control of 2 cards (Card c1, Card c2). If reset_phase and reset_count is specified, will behave like other effects with those resets (and so, the control will be returned when the effect has expired). Works only for monsters in Monster Zone.
bool | Duel.CheckLPCost(int player, int cost) | Checks if a player (int player) can pay an amount (int cost) of LP
void | Duel.PayLPCost(int player, int cost) | Make a player (int player) pay an amount (int cost) of LP
int | Duel.DiscardDeck(int player, int count, int reason) | A player (int player) sends the top n cards (int count) to the Graveyard (discard mechanic) with a reason (int reason)
int | Duel.DiscardHand(int player, function f, int min, int max, int reason, Group|Card ex|nil, ...) | Makes (int player) Discard between (int min) and (int max) cards from their hand for which (function f) returns true, except (Group|Card ex), for (int reason)
void | Duel.DisableShuffleCheck([disable=true]) | If disable is true, makes an action that adds/removes a card(s) from/to Deck/hand not trigger the shuffle check at the end of the the current routine execution. Putting false would revert to normal behavior.
void | Duel.ShuffleExtra(int player) | Shuffles the Extra Deck of (int player). Must be used after confirming cards in the Extra Deck.
void | Duel.ShuffleDeck(int player) | Shuffles the deck of (int player). Handled automatically if a card is sent to deck sequence -2.
void | Duel.ShuffleHand(int player) | Shuffles the hand of (int player). Handled automatically after Duel.ConfirmCards().
void | Duel.ShuffleSetCard(Group g) | Shuffles the set cards in (Group g). (Shifting Shadows)
void | Duel.ChangeAttacker(Card c[, int ign = false]) | Changes the current monster attacking to another card (Card c), if ignore counts is set to true (int ign) it will ignore if the card can still attack.
void | Duel.ReplaceAttacker(Card c) | [function no longer available after 1.034]
bool | Duel.ChangeAttackTarget(Card c|nil) | Changes the current monster being attacker to another card (or makes the attack a direct attack in case of no card being passed)
void | Duel.AttackCostPaid(int paid) | Register the status of payment of attack cost. If (int paid) == 2 means the attack cost is not paid.
void | Duel.ReplaceAttackTarget(Card c) | [to be checked but probably removed, seems to no exist]
void | Duel.CalculateDamage(Card c1, Card c2|nil) | Conduct damage calculation between (Card c1) as attacker and (Card c2) or opponent player (nil)
int | Duel.GetBattleDamage(int player) | Gets the battle damage (int player) would take
void | Duel.ChangeBattleDamage(int player, int value[, bool check=true]) | Changes the battle damage (int player) would take to (int value). If (bool check) == false, you are able change the battle damage that originally is 0.
void | Duel.ChangeTargetCard(int chainc, Group g) | Changes a target card group of a certain chain effect (or the effect itself if chainc = 0)
void | Duel.ChangeTargetPlayer(int chainc, in player) | Changes a target player of a certain chain effect (or the effect itself if chainc = 0)
void | Duel.ChangeTargetParam(int chainc, int param) | change a target card group of a certain chain effect (or the effect itself if chainc = 0)
void | Duel.BreakEffect() | Separates an effect for the purposes of timing (Reflects the effects of the conjunctives "then" and "also after that")
void | Duel.ChangeChainOperation(int chainc, function f) | Change the operation of a certain chain effect
bool | Duel.NegateActivation(int chainc) | Negatee the activation of an effect
bool | Duel.NegateEffect(int chainc) | Negates the effect that is in chain link (int chainc)
void | Duel.NegateRelatedChain(Card c, int reset) | Negates all effects activation in a chain related to a card (with a reset)
void | Duel.NegateSummon(Card|Group targets) | Negates the summon of a card or a group of cards
void | Duel.IncreaseSummonedCount([Card c]) | Increases the number of summons performed in a turn (or in a card)
bool | Duel.CheckSummonedCount([Card c]) | Check if a certain card can be summoned
int, int flag | Duel.GetLocationCount(int player, int location[, int use_player, int reason = LOCATION_REASON_TOFIELD], int zone = 0xff) | Returns 2 values. First the number of zones that a player (target_player) has available in a location of the field (int location)[, that can be used by the player (use_player), with intention of (reason), among certain zones (zone)]. Second return is a flag with the available zones.
Card | Duel.GetFieldCard(int player, int location, int seq) | Gets a card in certain location at a certain sequence
bool | Duel.CheckLocation(int player, int location, int seq) | Checks if there is an position (int seq) available for the player (int player) in the location (int location). (The sequence (int seq) is used to indicate the specific position of the location, for example in the location of monsters the sequence would go from 1 to 5., etc.)
int | Duel.GetCurrentChain() | Returns the number of the current chain.
... | Duel.GetChainInfo(int chainc, ...) | Returns the chain link properties (aka, chain Info, described by constant group CHAININFO_)) of the passed chain link (int chainc), or current chain if it's 0.
Card,... | Duel.GetFirstTarget() | Gets the current chain's first target card (first here doesn't mean "first when selected", so don't rely on this for multi-target effect)
int | Duel.GetCurrentPhase() | Gets the current Phase of the game (corresponds to PHASE_x in constants.lua)
void | Duel.SkipPhase(int player, int phase, int reset_flag, int reset_count[, int value]) | Makes the specified player (int player) skips the encountered phase (int phase), the effect is reset when reset_flag is met reset_count times. (int value) sets the skip effect's value (don't know what it's used for though...)
int | Duel.IsAttackCostPaid() | Return the status of payment of attack cost for a card (e.g. Mist Valley Falcon). Return 2 means it has not been paid.
bool | Duel.IsDamageCalculated() | Returns true if damage has been calculated during the current (or previous) damage calculation, otherwise returns false
Card | Duel.GetAttacker() | Get the attacking card (or nil if there is no attacker)
Card|nil | Duel.GetAttackTarget() | Gets the attack target card (or nil if there's no attack target/the attack is a direct attack)
bool | Duel.NegateAttack() | Negates the current attack. Has no effect if the game has confirmed battle (about to enter Damage Step)
void | Duel.ChainAttack([Card c]) | Makes the currently attacking card attacks a card (Card c) after it's current attack
void | Duel.Readjust() | Makes the game do the adjustments ( win, disable, control, self destroy, equip, position, trap monster). Calling this while adjusting (most likely, in EVENT_ADJUST) four times with the same card (calling this will raise EVENT_ADJUST at the end, so it is possible to loop) will make the card instantly destroyed.
void | Duel.AdjustInstantly([Card c]) | Adjust the stats of a card applying possible negation effects (i guess)
Group | Duel.GetFieldGroup(int player, int s, int o) | Gets a group containing cards from a specified location of a player (int player), s denotes the player's side of the field, o denotes opposing player's side of the field
int | Duel.GetFieldGroupCount(int player, int s, int o) | Counts the number of cards from a specified location of a player (int player), s denotes the player's side of the field, o denotes opposing player's side of the field
Group | Duel.GetDecktopGroup(int player, int count) | Gets a group of a player's (int player) top n (int count) cards of their Deck
Group | Duel.GetMatchingGroup(function f, int player, int s, int o, Group|Card ex|nil, ...) | Gets all cards in locations (int s) (on (int player)'s side of the field) and (int o) (on their opponent's) for which (function f) returns true, except (Card ex)
int | Duel.GetMatchingGroupCount(function f, int player, int s, int o, Group|Card ex|nil, ...) | Get the number of cards in locations (int s) (on (int player)'s side of the field) and (int o) (on their opponent's) for which (function f) returns true, except (Card ex)
Card | Duel.GetFirstMatchingCard(function f, int player, int s, int o, Group|Card ex|nil, ...) | Get the first card in locations (int s) (on (int player)'s side of the field) and (int o) (on their opponent's) for which (function f) returns true, except (Card ex)
bool | Duel.IsExistingMatchingCard(function f, int player, int s, int o, int count, Group|Card ex|nil, ...) | Checks if (int count) cards exist in locations (int s) (on (int player)'s side of the field) and (int o) (on their opponent's) for which (function f) returns true, except (Card ex)
Group | Duel.SelectMatchingCard(int sel_player, function f, int player, int s, int o, int min, int max[, cancelable=false], Group|Card ex|nil, ...) | Make (int sel_player) select between (int min) and (int max) cards in locations (int s) (on (int player)'s side of the field) and (int o) (on their opponent's) for which (function f) returns true, except (Card ex). If cancelable is true and the selection is canceled nil will be returned.
Group | Duel.GetReleaseGroup(int player[, bool use_hand=false, bool use_oppo=false]) | Returns the group of cards used in a tribute
integer | Duel.GetReleaseGroupCount(int player[, bool use_hand=false, bool use_oppo=false]) | Returns the number of cards in the group of cards used as tribute
bool | Duel.CheckReleaseGroup(int player, function f, int count[, bool use_hand=false, int max=min, bool check_field=false, Card card_to_check=nil, int to_player=player, int zone=0xff], Group|Card ex|nil, ...) | Check if there is a monster that can be used as tribute from the int player, that satisfies function, having a min of the count specified with the exception of some card/group if specified, ... are extra arguments.
bool | Duel.CheckReleaseGroupCost(int player, function f, int count, bool use_hand, function spcheck, card|group ex|nil,...) | Check if the player can tribute to activate effect a monster, satisfying a specific function
bool | Duel.CheckReleaseGroupEx(int player, function f, int count[, bool use_hand=false, int max=min, bool check_field=false, Card card_to_check=nil, int to_player=player, int zone=0xff, bool use_oppo=false], Group|Card ex|nil, ...) | Same as Duel.CheckReleaseGroup, except that it include hands too. If cancelable is true and the selection is canceled nil will be returned.
Group | Duel.SelectReleaseGroup(int sel_player, function f, int min, int max[, bool use_hand=false, bool cancelable=false, bool check_field=false, Card card_to_check=nil, int to_player=player, int zone=0xff, bool use_oppo=false], Group|Card ex|nil, ...) | Selects monsters to be tributed by int sel_player, that satisfies function f, within a amount betwen int min and int max (include these values), with exception of some card/group, if any, ... is extra arguments. If cancelable is true and the selection is canceled nil will be returned.
Group | Duel.SelectReleaseGroupEx(int player, function f, int min, int max[, bool use_hand=false, bool cancelable=false, bool check_field=false, Card card_to_check=nil, int to_player=player, int zone=0xff, bool use_oppo=false], Group|Card ex|nil, ...) | Same as Duel.SelectReleaseGroup, except that it includes hand too.
Group | Duel.SelectReleaseGroupCost(int player, function f, int min, int max, bool use_hand, function specialchk, card|group ex|nil,...) | select a group of cards to be tributed as cost by a int player that satisfies function f, needing to select from a int min number of card to a int max number of card, using or not the hand (bool use_hand), if a function specialchk is specified it need to satisfies that as well (for example aux.ChkfMMZ in case you need a free space later), with some exception and extra arguments.
Group | Duel.GetTributeGroup(Card c) | 
int | Duel.GetTributeCount(Card c[, Group mg, bool ex=false]) | 
void | Duel.GrabSelectedCard () | 
Group | Duel.SelectTribute(int player, Card c, int min, int max[, Group mg, bool ex=false]) | Makes (int player) select a (int min) and (int max) number of tributes to be used for (Card c). If provided, (mg) is the forced group.
int | Duel.GetTargetCount(function f, int player, int s, int o, Group|Card ex|nil, ...) | Returns the number of targets, except (Group/Card ex), that match (function f), taking (int player) as the referential player, in locations defined in (int s) for your cards and (int o) for opponent's.
bool | Duel.IsExistingTarget(function f, int player, int s, int o, int count, Group|Card ex|nil, ...) | Returns if that are at least (int count) targets, except (Group/Card ex) that match (function f), taking (int player) as the referential player, in locations defined in (int s) for your cards and (int o) for opponent's.
Group | Duel.SelectTarget(int sel_player, function f, int player, int s, int o, int min, int max[, bool cancelable=false], Group|Card ex|nil, ...) | Makes int sel_player select targets that match function f, from int s's possesion and/or int o's possesion, with a int min and int max of targets, except Group/Card ex. If cancelable is true and the selection is canceled nil will be returned.
Group | Duel.SelectFusionMaterial(int player, Card c, Group g[, Card gc|nil, int chkf=PLAYER_NONE]) | Makes int player select Fusion Materials to summon card c from group g.
void | Duel.SetFusionMaterial(Group g) | Defines a group (Group g) to be used as fusion material within an effect
Group | Duel.GetRitualMaterial(int player, bool checklevel = true) | Returns cards that are usable by player as ritual materials, if checklevel is set, only cards with level >0 will be returned
void | Duel.ReleaseRitualMaterial(Group g) | Tributes monsters from group g for a Ritual Summon
void | Duel.SetSelectedCard(Card|Group cards) | Sets a card/group (Card|Group targets) as cards that would need to be used as Synchro/Xyz/Ritual/Fusion materials
void | Duel.SetTargetCard(Card|Group targets) | Sets the target to be a card or group
void | Duel.ClearTargetCard() | Removes the targets defined
void | Duel.SetTargetPlayer(int player) | Defines the player to be the 'target' to (int player)
void | Duel.SetTargetParam(integer) | Defines the parameter
void | Duel.SetOperationInfo(int chainc, int category, Card|Group targets, int count, int target_player, int target_param) | Sets informations about the operation being performed in the current (int chainc = 0) chain, belonging to (int category), with a total of (int count) of card(s) from (Card|Group targets) being affected. These are used with GetOperationInfo. Also, the parameter passed here are checked if any of the summon related activities are checked like ACTIVITY_SUMMON, ACTIVITY_NORMALSUMMON, ACTIVITY_SPSUMMON and ACTIVITY_FLIPSUMMON.
bool,Card|Group,int,int,int | Duel.GetOperationInfo(int chainc, int category) | 
int | Duel.GetOperationCount(int chainc) | 
void | Duel.Overlay(Card c, Card|Group of_card) | Attachs (Card|Group of_card) to (Card c)
Group | Duel.GetOverlayGroup(int player, int s, int o) | Returns the group of cards currently as Xyz materials
int | Duel.GetOverlayCount(int player, int s, int o) | Return the number of cards currently as Xyz Materials
bool | Duel.CheckRemoveOverlayCard(int player, int s, int o, int count, int reason[, Group ocard]) | Returns if (int player) can remove a total of (int count) cards attached, for reason (int reason) from your field (int s) and/or opponent's (card o). If group (ocard) is provided, only checks if cards can be detached from monsters that match said group.
bool | Duel.RemoveOverlayCard(int player, int s, int o, int min, int max, int reason) | Player (int player) removes cards attached, from your field (int s) and/or opponent's  (int o), with a minimum of (int min), and a maximum of (int max), with reason (int reason)
void | Duel.Hint(int hint_type, int player, int desc) | Executes a Hint, to be displayed by int player with int desc
void | Duel.HintSelection(Group g) | Shows a hint of the group g selected
bool | Duel.SelectEffectYesNo(int player, Card c) | Asks (int player) if they would like to use the effect of (Card c), highlighting it
bool | Duel.SelectYesNo(int player, int desc) | Asks (int player) Yes or No, with the question being specified by (int desc)
int | Duel.SelectOption(int player[,bool confirm_dialog=true], int desc1, ...) | Allows (int player) to choose between any number of options, starting with (int desc1). Returns the index of the chosen option, e.g. desc1 returns 0, the second option returns 1, etc. If confirm_dialog is set to false, the announce will be performed, but the optselected hint wont' be shown
void | Duel.SelectSequence() | 
int | Duel.SelectPosition(int player, Card c, int pos) | Makes int player select a position int pos for card c
int | Duel.SelectDisableField(int player, int count, int s, int o, int filter, bool check) | Asks (int player) to select zones to be disabled, a number of zones up to (int count), in locations (int s) for the player and (int o) for their opponent, that are bitmasked by (int filter) <in another word, zones that are not filter>. Setting the optional parameter (bool check) to true allows the player to select any zones, including Pendulum and Extra Monster Zone which are normally not allowed.
int | Duel.AnnounceRace(int player, int count, int available) | Asks (int player) to announce (int count) number of Races, amongst those specified in (int available).
int | Duel.AnnounceAttribute(int player, int count, int available) | Asks (int player) to announce (int count) number of Attributes, amongst those specified in (int available).
int|nil,int|nil | Duel.AnnounceLevel(int player[,int min = 1,int max=12, int exception=nil,...]) | Asks (int player) to announce a number between (int min) and (int max), except any (int exception)s. Returns the chosen number, and the index of that number amongst the choices.
int | Duel.AnnounceCard(int player[, int type=TYPE_MONSTER+TYPE_SPELL+TYPE_TRAP]) | Makes int player declare a card. If the type is provided as extra parameter the card must be from that type
int | Duel.AnnounceType(int player) | Makes int player declare a type
int,int | Duel.AnnounceNumber(int player, int number, ...) | Asks (int player) to announce a number found amongst (int number)s. Returns the chosen number and its index amongst the options
int | Duel.AnnounceCoin(int player) | Asks (int player) to call heads or tails
... | Duel.TossCoin(int player, int count) | Tosses (int count) coins on behalf of (int player), and returns all the results
... | Duel.TossDice(int player, int count1[, int count2 = 0]) | Rolls (int count) dice on behalf of (int player), and returns all the results
int,int,int,int,int | Duel.GetCoinResult() | Returns multiple values per each coin flipped
int,int,int,int,int | Duel.GetDiceResult() | Returns the values per dice roled
void | Duel.SetCoinResult(int res, ... ) | Changes the result of a coin flip to the result provided
void | Duel.SetDiceResult(int res, ...) | Changes the result of a dice roll to the result provided
Effect|nil | Duel.IsPlayerAffectedByEffect(int player, int code) | Checks if (int player) is being affected by the effect (int code), e.g. Spirit Elimination or Blue-Eyes Spirit Dragon
bool | Duel.IsPlayerCanDraw(int player[, int count=0]) | Checks if (int player) can draw (int count) cards from their deck
bool | Duel.IsPlayerCanDiscardDeck(int player, int count) | Checks if a player (int player) can mill a number of cards (int count) from their Deck
bool | Duel.IsPlayerCanDiscardDeckAsCost(int player, int count) | Checks if a player (int player) can mill a number of cards (int count) from their Deck as cost
bool | Duel.IsPlayerCanSummon(int player[, int sumtype, Card c]) | Checks if (int player) can Normal Summon (Card c) through (int sumtype)
bool | Duel.IsPlayerCanSpecialSummon(int player[, int sumtype, int sumpos, int target_player, Card c]) | Checks if (int player) can Special Summon (Card c) through (int sumtype), in (int sumpos) position, to (int target_player)'s field
bool | Duel.IsPlayerCanFlipSummon(int player, Card c) | Checks if (int player) can Flip Summon (Card c)
bool | Duel.IsPlayerCanSpecialSummonMonster(int player, int code, int setcode, int type, int atk, int def, int level, int race, int attribute[, integer pos=POS_FACEUP, integer target_player=player, int sumtype]) | Checks if (int player) can Special Summon a monster fitting the given stats. 
bool | Duel.IsPlayerCanSpecialSummonCount(int player, int count) | Checks if (int player) can Special Summon (int count) times.
bool | Duel.IsPlayerCanRelease(int player, Card c) | Checks if a player (int player) can Tribute a card (Card c)
bool | Duel.IsPlayerCanRemove(int player, Card c) | Checks if a player (int player) can banish a card (Card c)
bool | Duel.IsPlayerCanSendtoHand(int player, Card c) | Checks if a player (int player) can send a card (Card c) to the Hand
bool | Duel.IsPlayerCanSendtoGrave(int player, Card c) | Checks if a player (int player) can send a card (Card c) to the Graveyard
bool | Duel.IsPlayerCanSendtoDeck(int player, Card c) | Checks if a player (int player) can send a card (Card c) to the Deck
bool | Duel.IsChainNegatable(int chainc) | Check if a chain's (int chainc) effect activation can be negated (Negate Activation)
bool | Duel.IsChainDisablable(int chainc) | Check if a chain's (int chainc) effect can be disabled (Negate Effect)
bool | Duel.CheckChainTarget(int chainc, Card c) | Checks if a card (Card c) can be a target for a chain's (int chainc) effect (via calling target(chkc) function of the effect)
bool | Duel.CheckChainUniqueness() | Checks if there is no card with the same name in the current chain
int,... | Duel.GetActivityCount(int player, int activity_type, ...) | Get the number of times (int player) has performed activities of (int activity_type)
bool | Duel.CheckPhaseActivity() | Checks if the an "activity" was not performed yet which means that the player is at "the start" of the current phase. Used for effects like Pot of Extravagance, Soundproofed and Mimir of the Nordic Ascendant.
void | Duel.AddCustomActivityCounter(int counter_id, int activity_type, function f) | Register an activity with type int activity_type, with id int counter_id, that matches function f
int | Duel.GetCustomActivityCount(int counter_id, int player, int activity_type) | Returns an activity with type int activity_type, with id int counter_id, for player int player
int | Duel.GetBattledCount(int player) | Get the number of battles (int player) has been involved in this turn
bool | Duel.IsAbleToEnterBP() | Checks if the player can enter BP this turn.
void | Duel.SwapDeckAndGrave(int player) | Swaps the cards from (int player)'s GY with the cards from his deck.
void | Duel.MajesticCopy(Card c1, Card c2) | Allows (Card c1) to use one of (Card c2)'s activated effects. (Majestic Star Dragon)
string | userdatatype(var o) | Checks if a variable is a Card, Group or Effect
Group | aux.GetMustBeMaterialGroup(int tp, nil|Group eg, int sump, nil|Card sc, nil|Group g, int r) | Gets the group that must be used as material (Contacting "C"). (int tp) is the affected player, (nil|Group eg) is all detected materials, (int sump) is the Summoning player, (nil|Card sc) is the card to be Summoned, (nil|Group) g is all the valid usable materials, (int r) is the reason e.g. REASON_SYNCHRO, REASON_XYZ
bool | Group.Includes(Group g1, Group g2) | Checks if (Group g1) contains all cards in (Group g2)
bool | Card.IsExtraLinked(Card c) | Checks if a card is Extra Linked, uses aux.ExtraLinked which obtains 2 Extra Monster Zone monsters of each player and checks if (Card c) is included in the chain of co-linked cards.
bool | Card.IsColumn(Card c, int seq, int tp, int loc) | Checks (Card c) its column using the data of another card which allows checking even if the other card has already left the field using its Sequence (int seq), controller (int tp) and location (int loc)
int | aux.Stringid(int code, int n) | Returns the description code using the database entry's code (int code) and from the nth position (int position) which can be 0-15 corresponding to the str in the database which are from str1 to str16
iterator | aux.Next(Group g) | Iterates over the cards in (Group g) for use with for loops
nil | aux.NULL() | Function that returns nil
bool | aux.TRUE() | Function that returns true. Can be used to return a whole group of cards in a certain location
bool | aux.FALSE() | Function that returns false
bool | aux.AND(...)(...) | First (...) is a list of functions which will be used to check the parameters in the second set of (...), separated with "and". The second set of (...) is applied automatically when used as a filter.
bool | aux.OR(...)(...) | First (...) is a list of functions which will be used to check the parameters in the second set of (...), separated with "or". The second set of (...) is applied automatically when used as a filter.
bool | aux.NOT(function f)(...) | This is equivalent to not f(...), if used as filter checking, (...) is automatically applied
table | aux.tableAND(...) | 
void | aux.BeginPuzzle() | Sets up the beginning of a puzzle, causing the player to lose during the End Phase
void | aux.PuzzleOp(Effect e, int tp) | Used by aux.BeginPuzzle(), sets the first turn player's LP to 0
bool | aux.IsGeminiState(Effect e) | Checks if an effect's handler (corresponding card) is a Gemini monster applying its effect.
bool | aux.IsNotGeminiState(Effect e) | returns not aux.IsGeminiState(Effect e)
bool | aux.GeminiNormalCondition(Effect e) | Checks if a monster is face-up and is not a Gemini monster or has not been Normal Summoned on the field.
void | aux.EnableGeminiAttribute(Card c) | Applies all the effects necessary for a Gemini monster to be used as one to (Card c).
void | aux.EnableSpiritReturn(Card c, int event1, int ...) | Sets up EVENT triggers to (Card c) so it returns to the hand during that End Phase, requires a minimum of 1 (int event1)
void | aux.SpiritReturnReg(e,tp,eg,ep,ev,re,r,rp) | Auxiliary function registration. Not used directly by card, only called by aux.EnableSpiritReturn
bool | aux.SpiritReturnCondition(e,tp,eg,ep,ev,re,r,rp) | Auxiliary condition. Not used directly by cards, only called by SpiritReturnReg
void | aux.SpiritReturnTarget(e,tp,eg,ep,ev,re,r,rp,chk) | 
void | aux.SpiritReturnOperation(e,tp,eg,ep,ev,re,r,rp) | 
bool | aux.TargetEqualFunction(function f, int value, ...) | Used in SetTarget filters (with parameters (e,c)) to check a function and its (...) parameters is equal to the inputted (int value).
bool | aux.TargetBoolFunction(function f, ...) | Used in SetTarget filters (with parameters (e,c)) to check a function and its (...) parameters
bool | aux.FilterEqualFunction(function f, int value, ...) | Used in filters (with parameter (Card c)) to check a function and its (...) parameters is equal to the inputted (int value).
bool | aux.FilterSummonCode(...) | used for Material Types Filter Bool (works for IsRace, IsAttribute, IsType)
bool | aux.FilterBoolFunctionEx(function f, int value) | Used filter for the Fusion, Xyz, Synchro and Link Procedures where (function f) can be Card.IsRace, Card.IsAttribute and Card.IsType and (int value) corresponds to the required Race, Attribute and Type.
bool | aux.FilterBoolFunctionEx2(function f, ...) | 
bool | aux.FilterBoolFunction(function f, ...) | Used in filters (with parameter (Card c)) to check a function and its (...) parameters
table element | aux.ParamsFromTable(table t, key, ...) | 
bool | aux.ProcCancellable | Used with the Xyz Summon procedure and a fw Xyz monsters. Defined as false.
bool | aux.IsMaterialListCode(Card c, int ...) | Checks if 1 of the codes in (int ...) is a listed Fusion Material in (Card c)
bool | aux.IsMaterialListSetCard(Card c, int ...) | Checks if 1 of the setcodes in (int ...) is a listed archetype in a material of (Card c)
bool | aux.IsCodeListed(Card c, int ...) | Checks if 1 of the codes in (int ...) is a listed card in (Card c)'s text
bool | aux.disfilter1(Card c) | Checks if (Card c) can be negated.
bool | aux.bdcon(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Default condition of EVENT_BATTLE_DESTROYING. "When this card destroys a monster by battle" and checks if itself is still the same state after battle.
bool | aux.bdocon(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Condition of EVENT_BATTLE_DESTROYING. "When this card destroys an opponent's monster by battle" and checks if itself is still the same state after battle.
bool | aux.bdgcon(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Condition of EVENT_BATTLE_DESTROYING. "When this card destroys a monster by battle and sends it to the Graveyard" and checks if itself is still the same state after battle.
bool | aux.bdogcon(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Condition of EVENT_BATTLE_DESTROYING. "When this card destroys an opponent's monster by battle and sends it to the Graveyard" and checks if itself is still the same state after battle.
bool | aux.dogcon(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | SetCondition for "is destroyed by your opponent".
bool | aux.exccon(Effect e) | SetCondition for "except the turn this card was sent to the Graveyard".
void | aux.chainreg(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Flag effect used for Spell Counter (that are put when the Spell card resolves)
bool | aux.imval1(Effect e, Card c) | default filter for EFFECT_CANNOT_BE_BATTLE_TARGET where (Card c) is checked to ensure it's not immune to (Effect e)
bool | aux.imval2(Effect e, Card c) | similar to aux.imval1, but also check if the monster is from opponent.
bool | aux.tgoval(Effect e, Effect re, int rp) | filter for EFFECT_CANNOT_BE_EFFECT_TARGET, "cannot be targeted by your opponent's card effects"
bool | aux.indsval(Effect e, Effect re, int rp) | Returns if the reason player is equal to effect e's handler player. Commonly used as filter for EFFECT_INDESTRUCTABLE_EFFECT + self
bool | aux.indoval(Effect e, Effect re, int rp) | Returns if the reason player is equal to 1-effect e's handler player. Commonly used as filter for EFFECT_INDESTRUCTABLE_EFFECT + opponent
bool | aux.nzatk(Card c) | Filter checking if (Card c) is face-up and has more than 0 ATK
bool | aux.nzdef(Card c) | Filter checking if (Card c) is face-up and has more than 0 DEF
void | aux.sumreg(Effect e, int tp, Group eg, int ep, int ev, Effect re, int r, int rp) | Used as SetOperation which registers a FlagEffect to cards in the event group with the same OriginalCode as itself
bool | aux.sumlimit(int sumtype) | 
bool | aux.fuslimit(Effect e, Effect se, int sp, int st) | SPSUMMON condition "Must be Fusion Summoned"
bool | aux.ritlimit(Effect e, Effect se, int sp, int st) | SPSUMMON condition "Must be Ritual Summoned"
bool | aux.synlimit(Effect e, Effect se, int sp, int st) | SPSUMMON condition "Must be Synchro Summoned"
bool | aux.xyzlimit(Effect e, Effect se, int sp, int st) | SPSUMMON condition "Must be Xyz Summoned"
bool | aux.penlimit(Effect e, Effect se, int sp, int st) | SPSUMMON condition "Must be Pendulum Summoned"
bool | aux.lnklimit(Effect e, Effect se, int sp, int st) | SPSUMMON condition "Must be Link Summoned"
bool | aux.damcon1(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Default condition for "If you would take effect damage"
bool | aux.qlifilter(Effect e, Effect te) | Default filter used with "Qli" monsters for: "Unaffected by activated monster effects whose original Rank/Level is lower than this card's Level"
bool | aux.nvfilter(Card c) | Filter check "not affected by Necrovalley"
bool | aux.NecroValleyFilter(function f)(Card target, ...) | Filter check "not affected by Necrovalley" in addition to its own filter, if used as function filter, (Card target, ...) is defined by default
bool | aux.bfgcost(Effect e, int tp, Group|nil eg, int ep, int ev, Effect re, int r, int rp, int chk) | Default SetCost for "You can banish this card from your Graveyard"
bool | aux.gbspcon(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Default SetCondition for "Summoned by a "Gladiator Beast" monster"
bool | aux.evospcon(Effect e, int tp, Group eg|nil, int ep, int ev, Effect re, int r, int rp) | Default SetCondition for "Summoned by a "Evolsaur" monster"
bool | aux.SpElimFilter(Card c, bool mustbefaceup, bool includemzone) | Spirit Elimination check to (Card c). It checks if controller is affected by Spirit Elimination. If so, it will only filter in the Monster Zone, otherwise in Graveyard. (bool mustbefaceup) means the filter is not generic (e.g. Banish 1 Dragon-Type monster) opposed to banish 1 monster. (bool includemzone) when set to true will check LOCATION_MZONE by default as opposed to filtering LOCATION_MZONE and LOCATION_GRAVE depending on affected by Spirit Elimination.
void | aux.AddEREquipLimit(Card c, function|nil con, function|nil equipval, function equipop, Effect linkedeff, int|nil prop, int|nil resetflag, int|nil resetcount) | Registers effects that need to be checked for the effect of "Millennium-Eyes Illusionist". (function con) is any conditions that need to be fulfilled in order to apply its "equipping" effect. (function equipval) is the filter of valid monsters you can equip to it. (function equipop) is the equipping by its effect. (Effect linkedeff) is the effect that equips. (int prop) is the list of additional properties for SetProperty to register effects. (int resetflag) and (int resetcount) is used if the effect would reset such as, until only the End Phase.
bool | aux.EquipByEffectAndLimitRegister(Card c, Effect e) | 
bool | aux.EquipByEffectLimit(Card c, Effect e, int tp, Card tc, int|nil code, bool mustbefaceup) | Equips (Card tc) to (Card c). Adding a (int code) will register that code as flag effect to the equipped card  (bool mustbefaceup) defines if the card to be equipped is required to be face-up.
int | aux.ComposeNumberDigitByDigit(int tp, int min, int max) | (int tp) declares a number by digit with a minimum of (int min) and maximum of (int max)
void | aux.ResetEffects(Group g, int eff) | Resets all effects with code (int eff) in a group of cards defined (Group g).
void | aux.CallToken(int code) | Function is used mostly for Anime Cards calling 419/420 to enable more functions. Also used in Anime Numbers with alias to prevent errors made by alias.
bool|Group | aux.SelectUnselectGroup(Group g, Effect e, int tp, int minc = 1, int maxc = 99, function|nil rescon, int chk, int seltp, int hintmsg, function|nil cancelcon, function|nil breakcon, bool cancelable) | Recursion checking and selection. (Group g) is the group to check and choose from, with a minimum (int minc) that defaults to 1 if set to nil and maximum (int maxc) that defaults to 99 if set to nil. (function rescon) is the condition to check which is needed fulfill. (int chk) is set to 0 to check and 1 to select. (int seltp) is the selecting player. (int hintmsg) is the HINTMSG that will be displayed on selection. (function cancelcon) is the condition when fulfilled allows you to end selection. (function breakcon) when fulfilled ends the selection automatically.
bool | aux.MZFilter(Card c, int tp) | Filter to check monsters if it's on a Main Monster Zone
bool | aux.ChkfMMZ(int sumcount)(Group sg, Effect e, int tp, Group mg) | Used in rescon by default. 2nd parenthesis is not required as rescon/cancelcon in aux.SelectUnselectGroup. (Group sg) is the selected group when using aux.SelectUnselectGroup.
bool|void | aux.RemainFieldCost(Effect e, int tp, Group|nil eg, int ep, int ev, Effect re, int r, int rp, int chk) | cost that is used in cards that stay on the field if they finish resolving. (e.g. Kunai with Chain, Different Dimension Burial)
void | aux.RemainFieldDisabled(Effect e, int tp, Group|nil eg, int ep, int ev, Effect re, int r, int rp) | 
bool, Group | aux.MainAndExtraSpSummonLoop(function|nil func, int sumtype, int sump, int targetp, bool nocheck, bool nolimit, int pos, int mmz, int emz)(Effect e, int tp, Group eg, int ep,int ev, Effect re, int r, int rp, Group sg) | Loops Special Summoning (Group sg) to ensure they go in a valid zone (Extra Moster Zone and Main Monster Zones) where (function func) is a function called after each card in the Group is summoned with the parameters (Effect e, int tp, Group eg, int ep,int ev, Effect re, int r, int rp, Card sc) where (Card sc) is the card that's Summoned. (int sumtype) is the Summon Type. (int sump) is the Summoning player. (int targetp) is the target player. (bool nocheck) checks for "ignoring the Summoning conditions". And (bool nolimit) checks for "ignoring proper Summon". (int pos) is the position to be Summoned. (int mmz) is the zones where you can Special Summon monsters in (Group sg) to the Main Monster Zone, which defaults to all Main Monster Zones if there is no input or nil is inputed. (int emz) on the other is similar to (int mmz) excepts it checks for cards from the Extra Deck which Special Summons to the Extra Monster Zone.
int | aux.MainAndExtraGetSummonZones(card c, int mmz, int emz, effect e, int sumtype, int sump, int targetp, bool nocheck, bool nolimit, int pos, nc, ...) | 
bool | aux.MainAndExtraZoneCheckBool(card c, int mmz, int emz, effect e, int sumtype, int sump, int targetp, bool nocheck, bool nolimit, int pos, nc, ...) | 
void | Fusion.AddProcMix(Card c, bool sub, bool insf, int|function ...) | Adds a Fusion Procedure where (bool sub) is a check if Fusion Substitutes are allowed. (bool insf) is a check if using no materials are allowed (e.g. Instant Fusion). (int|function ...) is a list of any number of codes/conditions as Fusion Materials. Member function from the Fusion namespace. Definition available in proc_fusion.lua.
nil|int | Fusion.CheckExact | A variable used temporarily to limit the usable materials' number
nil|function | Fusion.CheckAdditional | A variable used temporarily to add further checks (e.g. only up to 2 materials from the Extra Deck: Odd-Eyes Fusion)
void | Fusion.AddProcMixRep(Card c, bool sub, bool insf, function fun1, int minc, int maxc, int|function ...) | Adds a Fusion Procedure where (bool sub) is a check if Fusion Substitutes are allowed. (bool insf) is a check if using no materials are allowed (e.g. Instant Fusion). (function fun1) is a condition for a Fusion Material with a minimum (int minc) and maximum (int maxc) and (int|function ...) is a list of any number of codes/conditions as Fusion Materials.
void | Fusion.AddProcMixRepUnfix(c,sub,insf,...) | 
void | Fusion.AddContactProc(Card c, function group, function op, function sumcon, function|nil condition, int sumtype = 0, int|nil desc) | Adds a Contact Fusion Procedure to a Fusion monster which is a Summoning Procedure without having to use "Polymerization". (function group) is a function with (int tp) parameter which returns a Group of usable materials. (function op) is the operation that will be applied to the selected materials. (function sumcon) adds a limitation on a Fusion monster which applies to EFFECT_SPSUMMON_CONDITION. (function condition) is an additional condition to check. (int sumtype) is the Summon Type of the Contact Fusion, which defaults to 0. (int desc) is the description of the Summoning Procedure when selecting it.
void | Fusion.AddProcMixN(Card c, bool sub, bool insf, int|function, int ...) | Adds a Fusion Procedure where (bool sub) is a check if Fusion Substitutes are allowed. (bool insf) is a check if using no materials are allowed (e.g. Instant Fusion). (int|function ...) is a list of any number of codes/conditions as Fusion Materials, by pairs wherein the first value is int/function which is the code or condition, and the second value is an int which corresponds to the number of fixed materials.
void | Fusion.AddShaddolProcMix(Card c, bool insf, function f, int att) | Adds a Fusion Procedure where (bool insf) is a check if using no materials are allowed (e.g. Instant Fusion) and accepts 1 condition (function f) and 1 Attribute (int att).
void | Fusion.AddProcCode2(c,code1,code2,sub,insf) | Recipe for Fusion monsters that have code1 + code2 as materials. Exampe: Beast Machine King Barbaros Ür (Manga)
void | Fusion.AddProcCode3(c,code1,code2,code3,sub,insf) | Recipe for Fusion monsters that have code1+ code2 + code3 as materials. Not used by any cards.
void | Fusion.AddProcCode4(c,code1,code2,code3,code4,sub,insf) | Recipe for Fusion monsters that have code1+ code2 + code3 + code4 as materials. Not used by any cards.
void | Fusion.AddProcCodeRep(c, code1, n, sub, insf) | Recipe for Fusion monsters that have n "code1" cards as material. Not directly called by any card.
void | Fusion.AddProcCodeRep2(c,code1,minc,maxc,sub,insf) | Fusion monster, name * minc to maxc. nnot used by any card
void | Fusion.AddProcCodeFun(c,code1,f,cc,sub,insf) | Fusion monster, name + condition * n
void | Fusion.AddProcFun2(c,f1,f2,insf) | Fusion monster, condition + condition
void | Fusion.AddProcFunRep(c,f,cc,insf) | Fusion monster, condition * n
void | Fusion.AddProcFunRep2(c,f,minc,maxc,insf) | Fusion monster, condition * minc to maxc
void | Fusion.AddProcFunFun(c,f1,f2,cc,insf) | Fusion monster, condition1 + condition2 * n
void | Fusion.AddProcCodeFunRep(c,code1,f,minc,maxc,sub,insf) | Fusion monster, name + condition * minc to maxc
void | Fusion.AddProcCode2FunRep(c,code1,code2,f,minc,maxc,sub,insf) | Fusion monster, name + name + condition * minc to maxc
void | Fusion.AddProcFunFunRep(c,f1,f2,minc,maxc,insf) | Fusion monster, condition1 + condition2 * minc to maxc
effect | Ritual.AddProcGreater(Card c, function filter, int lv, string desc, function extrafil, function extraop, function matfilter, function stage2, int location, forcedselection, function customoperation, function specificmatfilter) | Adds a Ritual Summoning activation requring Tributes that meet (function filter), and with levels equal to or greater than the Ritual Monster's level
void | Ritual.AddProcGreaterCode(Card c, int lv, string desc,...) | Adds a Ritual Summoning activation requring Tributes for a Ritual monster with any of the card names of code (int ...), and with levels equal to or greater than the Ritual Monster's level
effect | Ritual.AddProcCode(card c, int _type, int lv, string desc, ...) | 
void | Ritual.AddProcEqual(Card c, function filter, int lv[, string desc, function extrafil, function extraop, matfilter, function stage2, int location, forcedselection, customoperation, function specificmatfilter]) | Adds a Ritual Summoning activation, requring Tributes that meet (function filter), and with levels exactly equal to the Ritual Monster's level or if (int lv) is provided, with level equal to that value. (int desc) is the description when activating the Ritual Spell.
void | Ritual.AddProcEqualCode(Card c, int lv, int desc, [...]) | Adds a Ritual Summoning activation, requring Tributes with any of the card names of code (int ...), and with levels exactly equal to the Ritual Monster's level or if (int lv) is provided, with level equal to that value. (int desc) is the description when activating the Ritual Spell when provided.
effect | Ritual.AddWholeLevelTribute(card c, function cond) | The current total level to match for the monster being summoned, to be used with monsters that can be used as whole tribute
effect | Ritual.CreateProc(card c,int _type, function filter, int lv, string desc, function extrafil, function extraop, function matfilter, function stage2,int location,group forcedselection, function customoperation, function specificmatfilter) | 
effect | Ritual.AddProc(card c,int _type, function filter, int lv, string desc, function extrafil, function extraop, function matfilter, function stage2, int location,group forcedselection, function customoperation,group specificmatfilter) | 
bool | Synchro.NonTuner(function f, a, b, c) | A filter used in a Synchro procedure when a material is supposed to be non-Tuner. It also has to satisfy condition of (function f) if provided with (a, b, c) parameters.
bool | Synchro.NonTunerEx(function f, int val) | A filter used in a Synchro procedure when a material is supposed to be non-Tuner. It also has to satisfy condition of (function f) which has to be Card.IsRace, Card.IsAttribute or Card.IsType, or a function that would use any of these 3. Also, (int val) is a parameter that is used in checking the (function f).
bool | Synchro.NonTunerCode(table params) | Used in the Synchro Summon procedure.
void | Synchro.AddProcedure(Card c, function f1, int min1, int max1, function f2, int min2, int max2, function sub1, function sub2, function req1, int reqct1, function req2, int reqct2, function reqm) | Adds a Synchro Procedure to (Card c) where (function f1) is the required Tuner, with a minimum (int min1) and maximum (int max1). (function f2) is the second material (which usually is a non-Tuner, with a minimum (int min2) and maximum (int max2). (function sub1) is a Tuner substitute (e.g. Nirvana High Paladin) while (function sub2) is a substitute to the second material(s). (function req1) are required Tuners to be used in that Summon, with a fixed number (int reqct1) on how many are needed to be used. (function req2) follows the same pattern but for the secondary material (e.g. Crystal Wing Synchro Dragon (Anime)). (function reqm) is the required material needed to be used in that Summon regardless if it's a Tuner or the second material (e.g. function overwrite by Blackwing - Gofu the Vague Shadow (Anime)).
bool | aux.TatsunecroFilter(Card c) | Returns is Card c has "3096468" as flag effect. Used in the Synchro summon procedure
int | Synchro.Send | a number representing how and where the Synchro Materials would be sent. 0 - (default) to grave, 1- to grave, returned from banished, 2 - banished face-up, 3 - banished face-down, 4 - sent to hand, 5, sent to Deck, 6 - destroyed.
void | Synchro.AddMajesticProcedure(Card c, function f1, bool cbt1, function f2, bool cbt2, function f3, bool cbt3, function ...) | Adds a Synchro Procedure to (Card c) used by Majestic Star Dragon where (function f1, f2 and f3) are the required material and (bool cbt1, cbt2 and cbt3) are a check if the respective material can be used as the Tuner in the Summon since rulings for Majestic Star/Red Dragon state that either or both Majestic Dragon (f1) and/or Stardust Dragon/Red Dragon Archfiend (f2) can be used as the Tuner, but the non-Tuner, for the case of using Phantom King Hydride (f3) cannot be treated as the Tuner for the Summon. You require a minimum of 1 among these 3 to be the Tuner. (function ...) is the list of required materials during the Summon.
void | Synchro.AddDarkSynchroProcedure(Card c, function f1, function f2, int plv, int nlv, function ...) | Adds a Synchro Procedure to (Card c) used by Dark Synchros where (function f1) is the first material, usually used by the non-Tuner and (function f2) as the Dark Tuner, whose Level to be subtracted from the first material. (int plv) is the target level when both materials are of positive value while (int nlv) is the target value if the first material is affected by Dark Wave. (int plv) defaults to the Synchro monster's level while (int nlv) defaults to the (int plv) if not supplied. (function ...) is the list of required materials during the Summon.
void | aux.AddUnionProcedure(Card c, function f, bool oldrule, bool oldprotect) | Adds the Union Procedure to (Card c) where (function f) is the cards you can equip the Union monster to, and (bool oldrule) is a check to apply old rulings of the Union monster. if oldprotect is not nil, uses old rules for destroy replacement (If the equipped monster would be destroyed, destroy this card instead.)
bool | aux.IsUnionState(Effect effect) | Used as a default condition to check if the handler of the effect is a Union monster equipped to another monster.
bool | aux.CheckUnionEquip(Card uc, Card tc) | A check if you can equip a Union monster (Card uc) to (Card tc).
void | aux.SetUnionState(card c) | See proc_union.lua.
bool | aux.CheckUnionEquip(uc,tc) | See proc_union.lua.
void | Xyz.AddProcedure(Card c, function|nil f, int|nil lv, int ct, f|nil alterf, int desc, int maxct=ct, function op, bool mustbemat, function exchk) | Adds an Xyz Procedure where (function f) is the required Xyz Material, and (int lv) is the required level, but it can also be nil if there is no required Level. (int ct) is the required number of materials. (function alterf) is the alternate material, e.g. Number C39: Utopia Ray. (int desc) is the description shown when attempting to Xyz Summon using (function alterf). (int maxct) is the maximum number of materials, which defaults to (int ct). (function op) is used by some monsters do something else in addition to using an Xyz Material (e.g. Digital Bug Corebage (detach 2 materials) or Number 99: Utopic Dragon (discard 1 "Rank-Up-Magic")). (bool mustbemat) is used if you can only use the listed materials during the Xyz Summon, this disallows Anime effects such as Orichalcum Chain (minus 1 material) or Triangle Evolution (triple material). (function exchk) is an additional check at the end of selecting materials (e.g. Number F0: Utopic Future (checks if the materials have the same Rank)
void | Pendulum.AddProcedure(Card c[, bool reg=true, int|nil desc]) | Applies all the effects necessary for a Pendulum card to be used as one to (Card c). Setting (bool reg) to false, will not register the activation effect, which is used in cards that cannot be activated since you don't have them in your hand (e.g. Xyz/Pendulums). (int desc) is an optional parameter adding a description to your Pendulum Activation.
void | Link.AddProcedure(Card c, function|nil f, int min, int max = c:GetLink(), function|nil specialchk, int desc) | Adds a Link Procedure where (function f) is the required material with a minimum (int min) and maximum (int max) where (function specialchk) is an additional check after obtaining all materials (e.g. Akashic Magician) and (int desc) is the description to its Link Summoning Procedure,
void | aux.AddEquipProcedure(Card c, int|nil p, function|nil f, function|nil eqlimit, function|nil cost, function|nil tg, function|nil op, function|nil con) | Adds the Equip Card Activation where (int p) is the player, setting 0 will limit to monsters you control, setting to 1 will be your opponent and PLAYER_ALL/nil will be for either player. (function f) is the filters on which monsters you can equip it to. (function eqlimit) if provided will that limitation on which monsters you can only equip it (e.g. Those that can only be equipped by this activation, e.g. Train Connection). (function cost) would be the cost to activate it. (function tg) are effects that applied to it after targeting the monster to equip, and also checking requirements. (function op) is any operation that is applied after the Equip Proc equips. (function con) returns a bool which are conditions that need to be fulfilled for the Equip Card to be activated.
void | aux.EquipEquip(Effect e, int tp, Group eg, int ep, int ev, Effect re, int r, int rp) | Used to equip the Equip Card to the targeted monster. This would be used if you cannot use the Equip Procedure for your Equip Card activation.
void | aux.AddPersistentProcedure(Card c, int|nil p, function|nil f, int|nil category, int|nil property, int|nil hint1, int|nil hint2, function|nil con, function|nil cost, function|nil tg, function|nil op, bool|nil anypos) | Adds the Persistent Trap Procedure where is the player, setting 0 will limit to monsters you control, setting to 1 will be your opponent and PLAYER_ALL/nil will be for either player. (function f) is the filters on which monsters you can target. (bool anypos) is a check if the target needs to be face-up. Setting this to true will allow it to be targeted even if it isn't face-up.
bool | aux.PersistentTargetFilter(Effect e, Card c) | Default filter for checking if it's targeted by the Persistent Trap.
function | aux.ReincarnationCheckValue(Effect e, Card c) | Auxiliary function for "Salamangreat" Reincarnation procedure. Registers CARD_SALAMANGREAT_SANCTUARY as flag  to (card c) if it is either a Link, Fusion or Ritual and has among its materials a card with the same ID as (card c).
bool | aux.ReincarnationRitualFilter(Effect e, Card c) | Auxiliary filter for "Salamangreat" Reincarnation procedure to handle the rituals.
bool | aux.ReincarnationCheckTarget(Effect e, Card c) | Auxiliary function for "Salamangreat" Reincarnation procedure. Returns if (card c) is either a Fusion, Ritual or a Link.
void | aux.EnableCheckReincarnation(Card c) | Auxiliary function for "Salamangreat" Reincarnation procedure. Enables reincarnation links.
bool | Card.IsReincarnationSummoned(Card c) | Interacts with the functions for "Salamangreat" Reincarnation procedure. Returns if card c has CARD_SALAMANGREAT_SANCTUARY as FlagEffect
function | aux.MaleficUniqueFilter(cc) | Used as filter for the uniqueness on field with the "Malefic" monsters
function | aux.AddMaleficSummonProcedure(c,code,loc,excond) | Procedure for "Malefic" monsters' Special Summon (also includes handling of "Malefic Paradox Gear"'s effect)
function | aux.MaleficSummonFilter(c,cd) | Filter used with AddMaleficSummonProcedure. Returns if card (Card c)'s ID is (cd) and if c can be banished as cost
function | aux.MaleficSummonSubstitute(card c, card cd, int tp) | Used with the Summoning Procedure of "Malefic" monsters. Checks for the effect of "Malefic Paradox Gear"
function | aux.MaleficSummonCondition(cd, int loc, function excon) | Auxiliary function for the summoning procedure of "Malefic" monsters. Checks if the player has the zone to summon and the appropriate monster (cd) to banish.
function  | aux.MaleficSummonOperation(cd, int loc) | Auxiliary function to handle the summoning procedure of "Malefic" monsters. Performs the actual summon of the monster by removing the appropriate monster.
group | aux.zptgroup(group eg, function filter, card c, int tp) | 
bool | aux.zptgroupcon(group eg, function filter, card c, int tp) | 
bool | aux.zptfilter(filter) | Used as filter for effects that check "if [filter] monster is Special Summoned to a zone this card points to". Also includes non-trivial handling of self-destructing effects of "Burning Abyss" monsters.
bool | aux.zptcon(filter) | Used as condition for effects that check "if a [filter] monster is Special Summoned to a zone this card points to". Includes non-trivial handling of self-destructing Burning Abyss monsters. tp is passed to check control.
bool | aux.WitchcrafterDiscardFilter(c) | Auxiliary function for the discard cost of "Witchcrafter" monsters. Returns if (Card c) can be either sent to the GY as a cost or has EFFECT_WITCHCRAFT_REPLACE.
bool | aux.WitchcrafterDiscardGroup(minc) | Auxiliary function for the discard cost of "Witchcrafter" monsters. Returns if there is a card with EFFECT_WITCHCRAFTER_REPLACE, that can be used as the whole cost, of if there is a (minc) number of cards to use as cost,  minc is the ammount the effect requires to discard.
void | aux.WitchcrafterDiscardCost(f, int minc, int maxc) | Auxiliary function for the discard cost of "Witchcrafter" monsters. Performs the actual discard part, considering a minimum (minc) and maximum (maxc) amount of cards to discard. It also handles cards with EFFECT_WITCHCRAFTER_REPLACE, setting the reason for REASON_COST for those, or REASON_COST+REASON_DISCARD if a card is sent from hand instead.
effect | aux.AddLavaProcedure(card c, int required, int position, funtion filter, int value, int description) | Adds Lava Golem-like procedure (monster that tribute to Special Summon on opponent's field), int required is the amount of monster to tribute, position is which position is it summoned and filter specify the monster it must tribute, value sets the type of Special summon and description adds a description for it. Calls the following auxiliary functions: LavaCondition, LavaCheck, LavaTarget and LavOperation, defined in cards_specific_functions.lua.
bool | aux.LavaCheck(sg,e,tp,mg) | See cards_specific_functions.lua
bool | aux.LavaCondition(required,filter) | See cards_specific_functions.lua
bool | aux.LavaTarget(required,filter) | See cards_specific_functions.lua
void | aux.LavaOperation(required,filter) | See cards_specific_functions.lua
effect, effect | aux.AddKaijuProcedure(card c) | Adds Kaiju's stardand procedure to the monster (which also includes the uniqueness on field condition). Calls the following auxilary function: KaijuCondition
bool | aux.KaijuCondition(e,c) | See cards_specific_functions.lua
bool | aux.NumeronDetachCost(int min, int max) | Auxiliary function to handle evaluate and execute detach costs for "Numeron" Xyz monsters that ignore costs due to the effect of "Numeron Network". Checks if player is affected by CARD_NUMERON_NETWORK, in which case it applies its effect. Otherwise, checks if the card using the function can detach a `int min` number of materials to detach and then detaches up to `int max` materials, if provided (or detaches `int min` if max is not provided).
bool | aux.IsZone(card c, int zone, int tp) | Returns if (card c) is in the (int zone), (int tp) is the reference player.
void | Debug.Message(any msg) | Sends (any msg) as a script error to the logs
Card | Debug.AddCard(int code, int owner, int player, int location, int seq, int pos[, bool proc=false]) | Add a card of (int code), owned by (int owner) and under (int player)'s control, to (int seq) of (int location) in (int pos) position. If (bool proc) is true, it will be treated as properly summoned for the purposes of revive limits.
void | Debug.SetPlayerInfo(int playerid, int lp, int startcount, int drawcount) | Set (int playerid) to have (int lp) LP, start with a (in startct) card hand, and draw (int drawcount) during the Draw Phase.
void | Debug.PreSummon(Card c, int sum_type[, int sum_location=0]) | Treat (Card c) as if it was summoned by (int sum_type), to (int sum_location)
bool | Debug.PreEquip(Card equip_card, Card target) | Equip (Card equip_card) to (Card target)
void | Debug.PreSetTarget(Card c, Card target) | Set (Card c)'s target card to (Card target) (e.g. Call of the Haunted)
void | Debug.PreAddCounter(Card c, int counter_type, int count) | Add (int count) counters of (int counter_type) to (Card c)
void | Debug.ReloadFieldBegin(int flag, int rule) | Begin loading the field for a puzzle, with DUEL_ constants in (int flag) under Master Rule (int rule)
void | Debug.ReloadFieldEnd() | Stop loading the field for a puzzle.
void | Debug.SetAIName(string name) | Set the name of the AI to (string name)
void | Debug.ShowHint(string msg) | Display a message on screen, saying (string msg)
int | Duel.SelectFieldZone(int player, int count, int s, int o, int filter[, bool check=false]) | Asks (int player) to choose a number of Zones up to (int count), in locations (int s) for the player and (int o) for their opponent, that are bitmasked by (int filter) <in another word, zones that are not filter>. Setting (bool check) to true allows the player to select any zones, including Pendulum and Extra Monster Zone which are normally not allowed.
int | Duel.GetRandomNumber([int min = 0,]int max) | Gets a random number between min (default is 0) and max. 
int | Duel.GetLinkedZone(int player) | Gets all the zones thta (int player) has that Link Monsters points to
int | Duel.GetFreeLinkedZone(int player) | Gets all the unoccupied zones that (int player) has that Link Monsters points to
int | Duel.RockPaperScissors([bool repeat=true]) | Has players play a game of Rock Paper Scissors. Return player (winner or PLAYER_NONE). If repeat == true, RPS continues until there is a winner, otherwise RPS is only played once.
void | Duel.SetFlagEffectLabel | Sets a label for a flag effect
void | Duel.SwapSequence | Exchanges the positions of two cards on the field
Group | Duel.GetLinkedGroup | Gets a group of cards the given Link Monster points to
int | Duel.GetChainEvent | Gets the event in a chain
Effect, ... | Duel.GetPlayerEffect (int player[, int effect_type]) | Returns all the effect with that code (int effect_type) applied on the player. With no effect_type or effect_type=0 it will return all the effects applied on the player. [effect_type refer to "EFFECT_" constants, eg: EFFECT_REVERSE_DAMAGE, EFFECT_CANNOT_MSET]
int | Duel.GetMasterRule() | Gets the master rule the current duel is being played under (eg. obsolute rules)
void | Duel.GetFlagEffectLabel | Returns the label of a flag effect, that was previously set
int | Duel.GetLocationCountFromEx(int player, [int rplayer, group|card sg, card lc]) | Gets the number of available zones that (int player) has to perform a Special Summon from the Extra Deck. Optional Parameters: int rplayer is the player performing the summon , by default comes from the player that activates the effect itself; sg are material(s) or tribute(s) for the special summon, it's included when the effect requires the cost of one or more cards; lc is the card that will be special summoned, it's included when it's a specific card which will be special summon). If lc is group, it cannot be passed directly. Instead, pass the type of the monsters in that group (e.g. TYPE_FUSION, see "Construct Element"), which is limited to a single type and will not work properly if the group has different types.
void | Duel.AssumeReset() | Manually resets assume effects. Usually used in syncro summon. (eg: it resets the applied effect of "Influence Dragon (Anime)" on the other materials in the Synchro Summon.)
int | Duel.GetLinkedGroupCount(card c) | Returns the number of cards linked to (card c)
int | Duel.GetUsableMZoneCount(int target_player[, int using_player=target_player]) | Gets the number of Monster Zones that are not disabled
void | Duel.Activate() | Activates a card/effect
int | Duel.GetMZoneCount(int target_player[, card|group ex = nil, int use_player = target_player, int reason = LOCATION_REASON_TOFIELD, int zone = 0xff]) | Gets the number of available Main Monster Zones of a player (target_player)[, excluding card|group (ex), that can be used by the player (use_player), with intention of (reason), among certain zones (zone)]    {note: Basically it is Duel.GetLocationCount that excludes}
bool | Card.IsNonEffectMonster(Card c) | Returns if (Card c) is a Monster and does not have TYPE_EFFECT
bool | Card.HasLevel(Card c) | Returns if a Card (Card c) has a level, which means it must match these criteria: not have TYPE_LINK, not have STAUS_NO_LEVEL, not be an Xyz, unless it is an Xyz that has EFFECT_RANK_LEVEL or EFFECT_RANK_LEVEL_S. A native check for TYPE_MONSTER was not included
bool | Card.IsSequence(c, ...) | Returns if a Card (Card c) is located at any of the sequences passed as arguments
bool | Group.CheckSameProperty(g, f, ...) | Returns if the members of (Group  g) share a same property, provided in (Function f)
bool | Card.IsInMainMZone(Card c, int tp) | Return if (Card c) is in a Main Monster Zone. If (int tp) is provided, also returns if (Card c) is of that controller.
bool | Card.IsInExtraMZone(Card c, int tp) | Return if (Card c) is in an Extra Monster Zone. If (int tp) is provided, also returns if (Card c) is of that controller.
bool | Card.IsRitualMonster(Card c) | Returns if (Card c) is a Ritual Monster.
bool | Card.IsRitualSpell(Card c) | Returns if (Card c) is a Ritual Spell.
bool | Card.IsOriginalCode(Card c, int cd) | Checks if (Card c) has original card name of (int cd)
bool | Card.IsOriginalCodeRule(Card c, int cd) | Checks if (Card c) has original code rule of (int cd)
bool | Card.IsOriginalType(Card c, int val) | Checks if (Card c) is of original card type (int val)
bool | Card.IsOriginalAttribute(Card c, int val) | Checks if (Card c) is of original attribute (int val)
bool | Card.IsOriginalRace(Card c, int val) | Checks if (Card c) is of original monster type (int val)
bool | Card.IsSummonPlayer(Card c, int tp) | Checks if (Card c) is summoned by player (int tp)
bool | Card.IsPreviousControler(Card c, int tp) | Checks if (Card c) is previous controlled by player (int tp)
bool | Card.IsSummonLocation(Card c, int loc) | Checks if (Card c) is summoned from location (int loc)
Group | Duel.GetTargetCards(Effect e) | Returns a group containing the targeted cards of (Effect e)'s activation
void | aux.ToHandOrElse(card c|group tc, int player, [function check, function oper, str],...) | Makes (int player) either add (card c|group tg) to hand or perform a secondary action. If the optional parameters are not provided, the default secondary action is to send the card or group to the GY. If  the provided (function check) is true (for all the cards in the group) , the secondary action, with string called from (str), will be the one defined in (function oper).
void | aux.thoeSend(card c) | Sends (card c) to the grave. Function added to be used with aux.ToHandOrElse
void | aux.RegisterClientHint(Card c, int property_code, int reg.player, int s, int o, str, int reset_code) | Auxiliary function to simplify registering EFFECT_FLAG_CLIENT_HINT to players. (Card c) is card that creates the hint message,  (int property_code) are additional properties like EFFECT_FLAG_OATH (PLAYER_TARGET and CLIENT_HINT are the flags registered by default). (int reg. player) is the player that is registering the hint, to himself (int s) and/or the opponent (int o), with a description called from a string defined in (str). Additional resets, other than the default RESET_PHASE+PHASE_END, can be passed in (int reset_code).
bool | aux.PlayFieldSpell(Card c,e,tp,eg,ep,ev,re,r,rp) | Activates a field spell Card "c". Already handles interactions with Field Spells that are already face up, rules for only 1 Field Spell at time, checks for costs and activated effects of the field spell and als the interaction with Ancient Pixie Dragon.
void | aux.GlobalCheck(s, function func) | Enables a global check to be used with function "func"
table | Card.GetMetatable(card c, code current_code) | 
table | Duel.GetMetatable(card c) | 
int | aux.EvilHeroLimit(e,se,sp,st) | Default SetValue for "Evil HERO" monsters's effect EFFECT_SPSUMMON_CONDITION. Must be used due to the existance of "Supreme King Castle"
bool | aux.ReleaseNonSumCheck(card c, int player, effect e) | Auxiliary function called by "Duel.CheckReleaseGroupSummon" and Duel.SelectReleaseGroupSummon".
int | aux.ZoneCheckFunc(card c, int player, int zone) | Auxiliary function called by "Duel.CheckReleaseGroupSummon" and Duel.SelectReleaseGroupSummon".
bool | aux.CheckZonesReleaseSummonCheck(group must, group oneof, function checkfunc) | Auxiliary function called by "Duel.SelectReleaseGroupSummon".
bool | Duel.CheckReleaseGroupSummon(card c, int player, effect e, function fil, int min, int max, function last,...) | 
bool | aux.CheckZonesReleaseSummonCheckSelection(group must, group oneof,function checkfunc) | 
bool | Duel.SelectReleaseGroupSummon(card c, int player, effect e, function fil, int min, int max, function last, ...) | 
bool | aux.ReleaseCostFilter(card c, function f,...) | 
bool | aux.ReleaseCheckSingleUse(group sg, int player, group exg) | 
bool | aux.ReleaseCheckMMZ(group sg, int player) | 
bool | aux.ReleaseCheckTarget(group sg, int player, group exg, group dg) | 
bool | aux.RelCheckRecursive(card c, int player, group sg, group mg, group exg, group mustg, int count, int min, function specialchk, ...) | 
bool | aux.RelCheckGoal(int player, group sg, group exg, group mustg, int count, int min, function specialchk, ...) | 
group | Duel.SelectReleaseGroupCost(int tp, function f, int minc, int maxc, bool use_hand, function specialchk, Card|Group ex, ...) | 
bool | Card.IsLinkMonster(card c) | Returns if Card C is a Link Monster. This function was added due to the introduction of Link Spells that makes checking only for IsType==TYPE_LINK not accurate depending on the effect used.
bool | Card.IsLinkSpell(card c) | Returns if Card C is a Link Spell.
table | aux.BitSplit(int number) | Auxiliary function to help printing hints for attribute-related cards such as Cynet Codec
table | aux.GetAttributeStrings(int number) | 
table | aux.GetRaceStrings(int number) | 
effect | Fusion.CreateSummonEff(card c, function fusfilter, function matfilter, function extrafil ,extraop, gc, function stage2, int exactcount, int value, int location, chkf, string desc) | Function that generates a Fusion Summon effect, called from the Fusion Summon Procedure defined in "proc_fusion.lua" and "proc_fusion2.lua". By default it's usable for Spells/Traps; usage in monsters requires changing type and code afterwards. [Card c] is card that uses the effect, [fusfilter] is the filter for the monster to be Fusion Summoned, [matfilter] is a function with the restrictions on the default materials returned by GetFusionMaterial,  [extrafil] is a function that returns a group of extra cards that can be used as fusion materials, and as second optional parameter an additional filter function, [extraop] is function called right before sending the monsters to the graveyard as material, [gc] is mandatory card or function returning a group to be used (Soprano the Melodious Songtress, etc), [stage2] is a function called after the monster has been summoned (Necro Fusion, Shaddol Ruq, Instant Fusion, Flash Fusion, etc.), [exactcount] is the exact number of materials that must be used if the effect requires it (Ostinato, etc.), [int location] is the location where to summon Fusion monsters from (by default, LOCATION_EXTRA), [chkf] are FUSPROC flags for the fusion summon and [desc] calls a string for the summon effect description.
void | Fusion.ShuffleMaterial(e,tc,tp,group sg) | Sends (group sg) to the Deck with REASON_EFFECT+REASON_MATERIAL+REASON_FUSION. Then clears the group sg. Used by the Fusion Summon procedure.
void | Fusion.BanishMaterial(e,tc,tp,group sg) | Banishes (group sg), face-up, with REASON_EFFECT+REASON_MATERIAL+REASON_FUSION. Then clears the group sg. Used by the Fusion Summon procedure.
bool | Fusion.OnFieldMat(filter,...) | Used by the Fusion Summon procedure.
bool | Fusion.InHandMat(filter,...) | Used by the Fusion Summon procedure.
bool | Fusion.IsMonsterFilter(function f,...) | Used by the Fusion Summon procedure.
bool | Fusion.ForcedHandler(effect e) | Used by the Fusion Summon procedure.
bool | Fusion.CheckWithHandler(fun,...) | Used by the Fusion Summon procedure.
effect | aux.AddNormalSummonProcedure(card c, bool ns, bool opt, int min, int max, int sum_type_val, string desc, function f, function sumop) | 
effect | aux.AddNormalSetProcedure(card c, bool ns, bool opt, int min, int max, int sum_type_val, string desc, function f, function sumop) | 
table | aux.tableOR(...) | 
function | aux.FunctionWithNamedArgs(function f, ...) | 
table,group | aux.GetExtraMaterials(int player, group mustg, group sc, int summon_type) | 
bool | aux.CheckValidExtra(card c, int player, group sg, group mg, lc, group emt, function filt) | 
void | aux.DeleteExtraMaterialGroups(group emt) | 
group | aux.GetMustBeMaterialGroup(int player, group eg, group sump, sc, group g, int r) | 
bool | Duel.IsSummonCancelable() | 
void | Duel.MoveToDeckTop(int|Card|Group targets) | 
void | Duel.MoveToDeckBottom(int|Card|Group targets, int player) | Shuffles a specific/group/certain number of card (targets) in the given player's (player) deck to the bottom of their deck.
bool | Duel.IsMainPhase() | Returns if the current phase is either Main Phase 1 or Main Phase 2.
bool | Duel.IsBattlePhase() | Returns if the current phase is the Battle Phase.
bool | Duel.IsTurnPlayer(int player) | Returns if it is the turn of the player passed as argument (int player).
int | aux.ChangeBattleDamage(int player, int value) | 
int | aux.GetCover(card c, coverNum) | Used by the Skill procedure.
bool | aux.CanActivateSkill(int player) | 
effect | aux.AddFieldSkillProcedure(card c, coverNum, drawless) | "Procedure for Field skills
--c: the skill (card)
--coverNum: the cover corresponding to the back (int)
--drawless: if the skill make you draw 1 less card at the start of the duel (bool)"
effect | aux.AddContinuousSkillProcedure(c,coverNum,drawless,flip) | "Procedure for continuous Spell/Trap Skill
-- c: the card (card)
-- coverNum: the Number of the cover (int)
-- drawless: if the player draw 1 less card at the start of the duel (bool)
-- flip: if the continuous card get flipped at the start of the duel (bool)"
effect | aux.AddSkillProcedure(c,coverNum,drawless,skillcon,skillop,countlimit) | "Procedure for basic skill
-- c: the card (card)
-- coverNum: the Number of the cover (int)
-- drawless: if the player draw 1 less card at the start of the duel (bool)
-- flip con: condition to activate the skill (function)
-- flipOp: operation related to the skill activation (function)"
effect | aux.SetSkillOp(coverNum,drawless,skillcon,skillop,countlimit,efftype) | 
effect | aux.AddPreDrawSkillProcedure(c,coverNum,drawless,skillcon,skillop,countlimit) | "Function for the skills that ""trigger"" at the start of the turn/Before the Draw
-- c: the card (card)
-- coverNum: the Number of the cover (int)
-- drawless: if the player draw 1 less card at the start of the duel (bool)
-- flip con: condition to activate the skill (function)
-- flipOp: operation related to the skill activation (function)"
effect | aux.AddVrainsSkillProcedure(c,skillcon,skillop,efftype) | "Procedure for Vrains Skills
--flip con: condition to activate the skill (function)
--flipOp: operation related to the skill activation (function)
--efftype: Event to trigger the Skill, default to EVENT_FREE_CHAIN. Additionally accept EFFECT_NEGATE_SKILL for Anti Skill (int)
"
bool | auxAuxiliary.CheckSkillNegation(e,tp) | Function to check whether the Skill would be negated by Anti Skill
bool | setcodecondition(effect e) | Returns if the code of the handler of "effect e" is the same as the originalcoderule of the handler of "effect e"
table | Card.AddSetCodeRules(card c, ...) | 
bool | Card.CheckAdjacent(card c) | Returns if either of the sequences next to the card c's sequence is available. Already handles the Extra monster zone (sequence > 4). Limited to Monster Zones.
bool | Card.MoveAdjacent(card c) | Executes a move operation for card c, to one of its available adjacent sequences (int the Monster Zone)
int | Card.UpdateAttack(card c, int amount, int reset, [card rc]) | Applies an ATK change to card c, equal to int amt, with resets defined in int reset. If the reason card rc is not provided, uses as default card c. Returns the ammount of ATK sucessfully changed.
int | Card.UpdateDefense(card c, int amount, int reset, [card rc]) | Applies a DEF change to card c, equal to int amt, with resets defined in int reset. If the reason card rc is not provided, uses as default card c. Returns the ammount of DEF sucessfully changed.
int | Card.UpdateLevel(card c, int amount, int reset, [card rc]) | Applies a level change to card c, equal to int amt, with resets defined in int reset. If the reason card rc is not provided, uses as default card c. Returns the ammount of levels sucessfully changed.
int | Card.UpdateRank(card c, int amount, int reset, [card rc]) | Applies a rank change to card c, equal to int amt, with resets defined in int reset. If the reason card rc is not provided, uses as default card c. Returns the ammount of ranks sucessfully changed.
int | Card.UpdateScale(card c, int amount, int reset, [card rc]) | Applies a link change to card c, equal to int amt, with resets defined in int reset. If the reason card rc is not provided, uses as default card c. Returns the ammount of links sucessfully changed.
int | Card.UpdateLink(card c, int amount, int reset, [card rc]) | Applies a scale change to card c, equal to int amt, with resets defined in int reset. If the reason card rc is not provided, uses as default card c. Returns the ammount of scales sucessfully changed.
bool | aux.HasCounterListed(card c, int counter_type) | Checks whether card c has an effect that mentions int counter_type counter. This includes adding, removing, gaining ATK/DEF per counter, etc. Corresponding table: "s.counter_list" ("s.counter_place_list" is already handled)
bool | aux.CanPlaceCounter(card c,int counter_type) | Checks whether card c has an effect that places int counter_type counters (on itself or others). Corresponding table: "s.counter_place_list".
bool | aux.dpcheck(function f) | Checks for cards with different properties (to be used with Aux.SelectUnselectGroup)
function | aux.dncheck | Checks for cards with different names (to be used with aux.SelectUnselectGroup)
bool | checkrecbin(c,g,val,f,...) | 
bool | Group.CheckDifferentPropertyBinary(group g,function f, ...) | Function to check if every card in a group has at least a different property from the others with a function that stores the properties in binary form.
bool | checkrec(c,g,t,f,...) | 
bool,void | Group.CheckDifferentProperty(group g,function f, ...) | function to check if every card in a group has at least a different property from the others with a function that stores the properties in multiple returns form
table | aux.PropertyTableFilter(function f, ...) | 
int | aux.AskEveryone(stringid) | 
int |  aux.AskAny(stringid) | 
void | aux.EnableExtraRules(c,card,init,...) | Functions to automate consistent start-of-duel activations for Duel Modes like Speed Duel, Sealed Duel, etc
void | aux.EnableExtraRulesOperation(card,init,...) | 
bool | aux.FieldSummonProcTg(function f1, function f2) | 
void | aux.AddValuesReset(resetfunc) | 
void | aux.ValuesReset() | 
bool | aux.HarmonizingMagFilter(c,e,f) | 
void | aux.DoubleSnareValidity(card c, int range, int property) | Registers that card c has an effect that can negate/destroy trap cards, while it is in the location defined in int range. Used by Double Snare to identify which cards it can destroy. Int property are additional properties other than the default EFFECT_FLAG_CANNOT_DISABLE|EFFECT_FLAG_SINGLE_RANGE.
int | aux.ChangeBattleDamage(int player, int value) | 
bool | Card.IsMonster(c) | Returns if card c is a monster type card