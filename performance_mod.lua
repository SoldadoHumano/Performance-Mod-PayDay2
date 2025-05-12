if managers.viewport then
    for _, vp in ipairs(managers.viewport:viewports()) do
        if vp:vp() then
            local effects = {
                { "shadow_processor", "empty" },
                { "shadow_modifier", "empty" },
                { "shadow_rendering", "empty" },
                { "post_SSAO", "empty" },
                { "bloom_combine", "bloom_combine_empty" },
                { "bloom_combine_post_processor", "bloom_combine_empty" },
                { "post_DOF", "empty" },
                { "video_anti_alias", "AA_off" },
                { "light_adaption", "no_light_adaption" },
                { "color_grading_post", "empty" },
                { "deferred_lighting", "empty" },
                { "apply_ambient", "empty" },
                { "hdr_post_processor", "empty" },
                { "post_LEX_composite", "empty" },
                { "depth_projection", "depth_project_empty" },
                { "reflection_visualization", "empty" },
                { "glossiness_visualization", "empty" },
                { "specular_visualization", "empty" }
            }
            for _, effect in ipairs(effects) do
                vp:vp():set_post_processor_effect("World", Idstring(effect[1]), Idstring(effect[2]))
            end
        end
    end
end
if RequiredScript == "lib/managers/enemymanager" then
    EnemyManager._MAX_NR_CORPSES = 0
    EnemyManager.MAX_MAGAZINES = 0
    local old_init = EnemyManager.init
    function EnemyManager:init(...)
        old_init(self, ...)
        self._corpse_disposal_upd_interval = 0
        self._shield_disposal_upd_interval = 0
        self._shield_disposal_lifetime = 0
        self._MAX_NR_SHIELDS = 0
    end
    local old_limit = EnemyManager.corpse_limit
    function EnemyManager:corpse_limit(...)
        local limit = old_limit(self, ...)
        return 0
    end
end
if RequiredScript == "lib/managers/gameplaycentralmanager" then
    local old_init = GamePlayCentralManager.init
    function GamePlayCentralManager:init(...)
        old_init(self, ...)
        self._block_bullet_decals = true
        self._block_blood_decals = true
    end
    function GamePlayCentralManager:_play_bullet_hit(...)
        return
    end
    function GamePlayCentralManager:play_impact_flesh(...)
        return
    end
    function GamePlayCentralManager:sync_play_impact_flesh(...)
        return
    end
end
if RequiredScript == "lib/units/enemies/cop/copdamage" then
    function CopDamage:_spawn_head_gadget(...)
        return
    end
end

print = function(...) end
cat_print = function(...) end
reload_and_compile = function(...) end
out = function(...) end
watch = function(...) end
cat_debug = function(...) end
cat_error = function(...) end
cat_stack_dump = function(...) end
cat_print_inspect = function(...) end
cat_debug_inspect = function(...) end
catprint_save = function(...) end
catprint_load = function(...) end
print_console_result = function(...) end
trace_ref = function(...) end
trace_ref_add_destroy_all = function(...) end
debug_pause = function(...) end
debug_pause_unit = function(...) end
compile_and_reload = function(...) end
class_name = function(...) end
full_class_name = function(...) end
error = function(...) end
local App = getmetatable(Application)
App.error = function(...) end
App.debug = function(...) end
if managers and managers.user and managers.savefile then
	managers.user:set_setting("max_streaming_chunk", 16384)
	managers.savefile:save_setting(true)
end