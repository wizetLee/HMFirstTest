import UIAbility from "@ohos:app.ability.UIAbility";
import type AbilityConstant from "@ohos:app.ability.AbilityConstant";
import type Want from "@ohos:app.ability.Want";
import hilog from "@ohos:hilog";
import type window from "@ohos:window";
import emitter from "@ohos:events.emitter";
import type resourceManager from "@ohos:resourceManager";
export default class EntryAbility extends UIAbility {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    }
    onDestroy(): void {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }
    onWindowStageCreate(windowStage: window.WindowStage): void {
        let context = this.context;
        let resourceManager: resourceManager.ResourceManager = context.resourceManager; // 获取当前应用的资源管理对象
        // Main window is created, set main page for this ability
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
        windowStage.loadContent('pages/Index', (err) => {
            if (err.code) {
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
        });
        // Environment和UIContext相关联，需要在UIContext明确的时候才可以调用。
        let window = windowStage.getMainWindow();
        window.then(window => {
            let uicontext = window.getUIContext();
            uicontext.runScopedTask(() => {
                Environment.envProp('languageCode', 'en');
            });
        });
    }
    onWindowStageDestroy(): void {
        // Main window is destroyed, release UI related resources
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }
    onForeground(): void {
        // Ability has brought to foreground
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
        let ie: emitter.InnerEvent = { eventId: 1 };
        let innerEvent: emitter.InnerEvent = ie;
        let eventData: emitter.EventData = {
            data: {
                "colorTag": 0
            }
        };
        emitter.emit(innerEvent, eventData);
    }
    onBackground(): void {
        // Ability has back to background
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
}
