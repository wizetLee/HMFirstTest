import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { emitter } from '@kit.BasicServicesKit';
import resourceManager from '@ohos.resourceManager';
import { WindowManager } from '@kit.SpeechKit';

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
    let mainWindow = windowStage.getMainWindow()

    mainWindow.then(windowInstance => {
      {
        let windowProperties = windowInstance.getWindowProperties();
        let windowRect = windowProperties.windowRect;
        let drawableRect = windowProperties.drawableRect;

      }
      {
        let avoidAreaSys = windowInstance.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        let topRectHeight = avoidAreaSys.topRect.height; // 获取到状态条区域的高度
        let avoidAreaNav = windowInstance.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
        let bottomRectHeight = avoidAreaNav.bottomRect.height; // 获取到导航条区域的高度
        console.log("尺寸相关信息: " + "安全域:"
          + "||"
          + `avoidAreaSys.topRect.height=${avoidAreaSys.topRect.height}`
          + "||"
          + `avoidAreaSys.bottomRect.height=${avoidAreaSys.bottomRect.height}`
          + "||"
          + `avoidAreaSys.leftRect.height=${avoidAreaSys.leftRect.height}`
          + "||"
          + `avoidAreaSys.rightRect.height=${avoidAreaSys.rightRect.height}`
        )
      }

      let uicontext = windowInstance.getUIContext()
      uicontext.runScopedTask(() => {
        Environment.envProp('languageCode', 'en');
      })
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');


  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');


    let ie: emitter.InnerEvent = {
      eventId: 1
    };
    let innerEvent: emitter.InnerEvent = ie
    let eventData: emitter.EventData = {
      data: {
        "colorTag": 0
      }
    }
    emitter.emit(innerEvent, eventData)
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
